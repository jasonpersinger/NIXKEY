# NIXKEY Storefront Redesign Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Transform the NIXKEY.SHOP storefront into a high-converting, "Safe Onramp" and "Tinkerer's Toolkit" by focusing on SEO, clarity, and physical product quality.

**Architecture:** Single-page static HTML (`index.html`) with Snipcart integration. The redesign uses Semantic HTML for SEO and a refined "Outcome-First" product catalog.

**Tech Stack:** HTML5, CSS3, Vanilla JavaScript, Snipcart.

---

### Task 1: Foundation & SEO Semantics

**Files:**
- Modify: `index.html:1-50`

- [ ] **Step 1: Update Meta Tags & Title**

Update the `<title>` and `<meta name="description">` to match the new "Safe Onramp" strategy.

```html
<title>NIXKEY.SHOP | The Safest Way to Try Linux</title>
<meta
  name="description"
  content="The safest, fastest way to try Linux. Hand-flashed, high-speed USB drives with a physical guide to help you get started. No installation, no risk, just plug and play."
>
```

- [ ] **Step 2: Add JSON-LD Schema Markup**

Add a `<script type="application/ld+json">` block in the `<head>` for the store and products.

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org/",
  "@type": "Store",
  "name": "NIXKEY",
  "image": "https://nixkey.shop/nixkey_logo_primary.svg",
  "description": "Premium bootable Linux USB drives for beginners and tinkerers.",
  "address": {
    "@type": "PostalAddress",
    "addressLocality": "Roanoke",
    "addressRegion": "VA",
    "addressCountry": "US"
  },
  "url": "https://nixkey.shop",
  "priceRange": "$19.99"
}
</script>
```

- [ ] **Step 3: Commit**

```bash
git add index.html
git commit -m "feat: update SEO meta tags and add JSON-LD schema"
```

---

### Task 2: Hero Section Overhaul

**Files:**
- Modify: `index.html:850-950` (approximate)

- [ ] **Step 1: Update Hero Copy**

Replace the current hero headlines and text with the "Safe Onramp" copy.

```html
<div class="eyebrow">Risk-free exploration. No installation required.</div>
<h1>The Safest Way to Try Linux.</h1>
<p>
  Try any Linux on your own computer without touching your files. Just plug in, boot up, and explore. 
  When you're done, unplug and your PC is exactly as you left it.
</p>
<div class="hero-cta">
  <a class="button" href="#catalog">Find Your Version</a>
  <a class="ghost-button" href="#why">How it Works</a>
</div>
```

- [ ] **Step 2: Swap Hero Image**

Update the hero shot to use `NIXKEYsample.jpg`.

```html
<div class="hero-shot-card" aria-label="NIXKEY physical guide">
  <div class="hero-logo-stage">
    <img class="hero-shot-brand" src="./NIXKEYsample.jpg" alt="NIXKEY physical welcome kit and guide">
  </div>
</div>
```

- [ ] **Step 3: Commit**

```bash
git add index.html
git commit -m "feat: overhaul hero section with safe onramp copy and physical guide image"
```

---

### Task 3: The "Tinkerer's Toolkit" (Why NIXKEY)

**Files:**
- Modify: `index.html:980-1050` (approximate)

- [ ] **Step 1: Rewrite "Why NIXKEY" Section**

Update the "Why NIXKEY" headers and descriptions to focus on "Solid Metal" and "Hand-Verified."

```html
<div class="mini-panel">
  <strong>All-Metal, High-Speed Media</strong>
  <p>Ditch the plastic. Every NIXKEY is built on a solid, metal-cased USB 3.2 drive designed to live on your keychain and survive the bottom of your bag.</p>
</div>
<div class="mini-panel">
  <strong>Hand-Verified in Roanoke</strong>
  <p>We don't just 'burn' a drive. We hand-flash every unit in our Roanoke studio and verify the checksums to ensure your first boot is a successful one.</p>
</div>
<div class="mini-panel">
  <strong>The Physical Guidebook</strong>
  <p>No PDFs or 'ReadMe' files hidden on the drive. Every order arrives with a physical, step-by-step card that guides you from 'Off' to 'Linux' in under 60 seconds.</p>
</div>
```

- [ ] **Step 2: Commit**

```bash
git add index.html
git commit -m "feat: rewrite Why NIXKEY section for tinkerers and beginners"
```

---

### Task 4: Outcome-First Product Catalog

**Files:**
- Modify: `index.html:1150-1700` (JavaScript section)

- [ ] **Step 1: Update Product Categories & Descriptions**

Rewrite the `products` array to use outcome-focused descriptions and use cases.

```javascript
const products = [
  {
    id: "ubuntu",
    name: "NIX/UBUNTU",
    distro: "Ubuntu",
    category: "beginner",
    useCase: "Best for: Windows Switchers & Older PCs",
    storage: "32GB",
    price: 19.99,
    accent: "#FF8C00",
    description: "The most popular starting point. Familiar, fast, and stable on almost any hardware.",
    specs: ["Beginner friendly", "Widely supported", "USB 3.2", "Physical guide"],
  },
  {
    id: "mint",
    name: "NIX/MINT",
    distro: "Linux Mint",
    category: "beginner",
    useCase: "Best for: Windows Switchers & Older PCs",
    storage: "32GB",
    price: 19.99,
    accent: "#00CED1",
    description: "The best 'first step' for Windows users. Familiar desktop with a smooth, easy transition.",
    specs: ["Beginner friendly", "Smooth desktop", "USB 3.2", "Physical guide"],
  },
  {
    id: "tails",
    name: "NIX/TAILS",
    distro: "Tails",
    category: "privacy",
    useCase: "Best for: Secure Browsing & Public PCs",
    storage: "32GB",
    price: 19.99,
    accent: "#7dd3fc",
    description: "Total privacy on a keychain. Boots into a secure, 'amnesic' session that leaves no trace on the computer.",
    specs: ["Privacy focused", "Amnesic", "USB 3.2", "Physical guide"],
  },
  // ... apply similar logic to others
];
```

- [ ] **Step 2: Update Category Metadata**

Update the `categoryMeta` object for the new grouping.

```javascript
const categoryMeta = {
  beginner: {
    title: "Best for Beginners",
    note: "Safe, familiar starting points for Windows switchers and new users.",
  },
  creator: {
    title: "Best for Creators",
    note: "Modern desktops for developers, designers, and makers.",
  },
  gaming: {
    title: "Best for Gaming",
    note: "Performance-first builds for PC gaming and handhelds.",
  },
  privacy: {
    title: "Secure & Private",
    note: "Focused builds for secure browsing and total privacy.",
  },
  power: {
    title: "Tinkerer & Rolling",
    note: "Advanced distros for enthusiasts who want deeper control.",
  },
};
```

- [ ] **Step 3: Commit**

```bash
git add index.html
git commit -m "feat: update product catalog with outcome-focused curation"
```

---

### Task 5: The "Fear-Killing" FAQ

**Files:**
- Modify: `index.html:1080-1140` (approximate)

- [ ] **Step 1: Rewrite FAQ Section**

Update the FAQ questions and answers to directly address beginner fears.

```html
<article class="panel faq">
  <div class="faq-label">Fear-Free</div>
  <h3>Can I break my computer?</h3>
  <p>No. That's the beauty of it. A NIXKEY runs entirely from the USB drive. It doesn't touch your hard drive or your files unless you explicitly tell it to. Unplug it, and your computer is exactly as you left it.</p>
</article>
<article class="panel faq">
  <div class="faq-label">Support</div>
  <h3>What if I get stuck?</h3>
  <p>Every order comes with a physical, step-by-step guide to get you past the 'Boot Menu' and into Linux. If you're still having trouble, our support team in Roanoke is just an email away.</p>
</article>
```

- [ ] **Step 2: Commit**

```bash
git add index.html
git commit -m "feat: rewrite FAQ to address beginner hesitation"
```

---

### Task 6: Final Polish & Verification

**Files:**
- Modify: `index.html`

- [ ] **Step 1: Final Copy Polish**

Review all remaining text for "Senior Software Engineer" precision and "Sledgehammer" brevity.

- [ ] **Step 2: Verify Responsive Design**

Check that the new hero image and layout work well on mobile.

- [ ] **Step 3: Push to GitHub**

```bash
git push origin main
```
