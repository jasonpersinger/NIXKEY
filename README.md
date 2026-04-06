# NIXKEY Project Notes

This folder contains the current single-page storefront for `NIXKEY.SHOP`, a premium brand selling bootable Linux USB drives.

## Current State

- Main storefront: `index.html`
- Hosting model: static site
- Commerce: Snipcart is wired into the page, but `YOUR_SNIPCART_PUBLIC_API_KEY` in `index.html` still needs to be replaced with the real key.
- Pricing rule: every USB is `$19.99`
- Capacity rule: every USB is `32GB`
- Catalog is grouped by category in the default view:
  - Beginner-Friendly
  - Creator & Gaming
  - Privacy & Security
  - Power User & Rolling

## Brand Foundation

Use the existing NIXKEY assets as the source of truth before redesigning anything.

- Primary logo: `nixkey_logo_primary.svg`
- Favicon / prompt mark: `nixkey_favicon.svg`
- Featured packaging art used in the hero and product buttons: `nixmintcard.png`
- Brand docs and packaging language: `extras/BRANDING.md`
- Printed insert copy / tone reference: `extras/NIXKEY_README.txt`
- Cheat sheet / support tone reference: `extras/NIXKEY_Cheat_Sheet.txt`

Brand direction is intentionally premium, restrained, and darker:

- Palette: teal / orange accents on near-black
- Tone: trustworthy, polished, beginner-safe but still credible to experienced Linux users
- Avoid clutter, novelty UI, or marketplace-style noise

## Storefront Rules

- Keep the layout minimal and premium
- Do not drift away from the existing logo, palette, and packaging language
- Product cards should stay clean and scannable
- Distro names are used descriptively; NIXKEY is an independent seller, not an official distro partner
- If adding products, keep Snipcart data attributes in sync with visible product content

## Current Distros

The catalog currently includes:

- Ubuntu
- Linux Mint
- CachyOS
- Bazzite
- Pop!_OS
- Debian
- MX Linux
- Zorin OS
- elementary OS
- EndeavourOS
- Fedora
- Manjaro
- Tails
- Parrot OS
- Kicksecure
- Qubes OS
- Kali Linux
- Arch Linux
- openSUSE
- PikaOS
- NixOS
- KDE neon
- Omarchy
- Puppy Linux
- Void Linux
- Kubuntu
- Lubuntu

## Important Files

- `index.html`: live storefront, CSS, JS, Snipcart integration, and product catalog
- `extras/`: brand references, packaging mockups, welcome kit, label ideas
- `flash_nixkey.sh`: USB flashing workflow script, unrelated to storefront rendering but relevant to business operations

## If Another Model Picks This Up

Start by reading:

1. `README.md`
2. `extras/BRANDING.md`
3. `index.html`

Then preserve these constraints:

- keep `$19.99` pricing unless explicitly changed
- keep `32GB` capacity unless explicitly changed
- keep Snipcart integration intact unless replacing it intentionally
- prefer simplifying over adding more visual complexity
