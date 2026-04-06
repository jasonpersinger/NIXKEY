#!/bin/bash
# ==============================================================================
# NIXKEY Master Flasher v1.0
# "The world is yours. We just provide the key."
# ==============================================================================

# 1. ROOT CHECK
if [[ $EUID -ne 0 ]]; then
   echo "Error: This script must be run as root (use sudo)." 
   exit 1
fi

# 2. PATH SETUP
BASE_DIR="/home/jason/HOLLERWORKS/companies/NIXKEY"
ISO_DIR="$BASE_DIR/isos"
EXTRAS_DIR="$BASE_DIR/extras"

# 3. SELECT ISO
echo "--------------------------------------------------------------------------------"
echo "STEP 1: SELECT YOUR DISTRO"
echo "--------------------------------------------------------------------------------"
files=("$ISO_DIR"/*.iso)
if [ ${#files[@]} -eq 0 ]; then
    echo "Error: No ISO files found in $ISO_DIR"
    exit 1
fi

for i in "${!files[@]}"; do
    echo "$i) $(basename "${files[$i]}")"
done

read -p "Select a number (0-$((${#files[@]}-1))): " iso_idx
SELECTED_ISO="${files[$iso_idx]}"

if [ -z "$SELECTED_ISO" ]; then echo "Invalid selection."; exit 1; fi

# 4. SELECT TARGET USB
echo ""
echo "--------------------------------------------------------------------------------"
echo "STEP 2: SELECT YOUR USB DRIVE"
echo "--------------------------------------------------------------------------------"
lsblk -dno NAME,SIZE,MODEL | grep -v "sda" # Try to hide the main drive
echo "--------------------------------------------------------------------------------"
read -p "Enter the drive name (e.g., sdb): " DRIVE_NAME
TARGET_DRIVE="/dev/$DRIVE_NAME"

if [ ! -b "$TARGET_DRIVE" ]; then
    echo "Error: $TARGET_DRIVE is not a valid block device."
    exit 1
fi

# FINAL WARNING
echo ""
echo "!!! WARNING !!!"
echo "You are about to WIPE $TARGET_DRIVE and flash $(basename "$SELECTED_ISO")."
echo "ALL DATA ON $TARGET_DRIVE WILL BE PERMANENTLY LOST."
read -p "Are you absolutely sure? (y/N): " confirm
if [[ ! $confirm =~ ^[Yy]$ ]]; then echo "Aborted."; exit 1; fi

# 5. FLASH THE ISO
echo ""
echo "Flashing ISO... this may take a few minutes."
dd if="$SELECTED_ISO" of="$TARGET_DRIVE" bs=4M status=progress conv=fsync
sync

# 6. CREATE EXTRAS PARTITION (The NIXKEY Magic)
echo ""
echo "Creating NIXKEY_EXTRAS partition..."
# Inform OS of partition changes
partprobe "$TARGET_DRIVE"

# Get the end of the last partition
LAST_PART_END=$(parted "$TARGET_DRIVE" -s unit MiB print | awk '/^ / {last=$3} END {print last}' | sed 's/MiB//')
DRIVE_SIZE=$(parted "$TARGET_DRIVE" -s unit MiB print | grep "Disk /dev" | awk '{print $3}' | sed 's/MiB//')

# Create a new partition in the remaining space
# We format it as ExFAT so Windows/Mac can read the extras
parted "$TARGET_DRIVE" -s mkpart primary fat32 "${LAST_PART_END}MiB" 100%
sync
partprobe "$TARGET_DRIVE"

# Find the new partition name (usually the last one)
NEW_PART="${TARGET_DRIVE}$(lsblk -nlo PARTN "$TARGET_DRIVE" | tail -n 1)"

echo "Formatting Extras partition as ExFAT..."
mkfs.exfat -n "NIXKEY" "$NEW_PART"

# 7. INJECT EXTRAS
echo "Injecting NIXKEY README and Cheat Sheet..."
mkdir -p /mnt/nixkey_tmp
mount "$NEW_PART" /mnt/nixkey_tmp
cp -r "$EXTRAS_DIR"/* /mnt/nixkey_tmp/
sync
umount /mnt/nixkey_tmp
rmdir /mnt/nixkey_tmp

echo ""
echo "================================================================================"
echo "SUCCESS! Your NIXKEY is ready."
echo "Distro: $(basename "$SELECTED_ISO")"
echo "Extras: README and Cheat Sheet injected."
echo "================================================================================"
