# 💼 Remon Chandra Howlader — Software Engineer Portfolio (Flutter Web)

> **Live Production Ready Portfolio** built 100% using Flutter Web with Dark Obsidian Cyber aesthetic, Clean Architecture principles, 60 FPS fluidity, and interactive glassmorphic micro-animations.

---

## 🌟 Features Included

- **Header / Navigation Bar**:
  - Sticky glassmorphism blur navbar (`BackdropFilter`) with smooth opacity on scroll.
  - Quick navigation pills: `About`, `Skills`, `Experience`, `Projects`, `Education`, `Contact`.
  - Responsive Mobile Navigation Drawer for smaller screens.
  - "Get in Touch" glow button.

- **Hero Section**:
  - Live availability badge (`● Available for New Projects & Opportunities`).
  - Bold typography with cyber gradient shaders (`#00D2FF` to `#6366F1`).
  - Metric counters (`3+ Years Exp.`, `5+ Published Apps`, `60 FPS Fluidity`, `100% Clean Architecture`).
  - Interactive Dart code preview terminal card (`profile.dart`).
  - Social quick buttons (`GitHub`, `LinkedIn`, `Email`, `WhatsApp`).

- **About Me Section**:
  - Professional summary directly reflecting your extensive mobile architecture experience.
  - 4 Architectural Pillars:
    - *Clean Architecture & Modular MVVM*
    - *60 FPS & Zero Memory Leaks (DevTools / Xcode profiling)*
    - *Real-Time Streaming & WebRTC (LiveKit, WebSockets)*
    - *FinTech & In-App Subscriptions (StoreKit, RevenueCat, Stripe, SSLCommerz)*

- **Technical Skills Section**:
  - Interactive Category Filter (`All`, `Core Technologies`, `Architecture & State`, `Backend & Cloud`, `Publishing & DevOps`, `Integrations`).
  - Glowing skill chips and badges for all tools in your stack.

- **Professional Experience Section**:
  - Full experience card for **Senior Flutter Developer** at **MAK Tech Solution** (01/2025 – Present).
  - Detailed bullet achievements, metrics, and technology pills.

- **Featured Published Applications**:
  1. **Inara Yoga** — Studio Booking App (iOS App Store)
  2. **Sonographer Pal** — Medical EdTech Simulator (Google Play)
  3. **Al Khalifa Food Delivery** — On-Demand Food Logistics (Google Play)
  - Features real store links, architecture tags, and platform badges.

- **Education & Training**:
  - **B.Sc. in Computer Science & Engineering** from City University (CGPA 3.16 / 4.0).
  - BITM & Ostad Ltd. Flutter masterclass certifications.

- **Interactive Contact Section**:
  - Working email prefill (`mailto:`) with form validation.
  - Direct WhatsApp trigger.
  - One-click copy for email and phone number with feedback snackbars.

---

## 🚀 How to Run Locally

```bash
# Get dependencies
fvm flutter pub get

# Run on Chrome
fvm flutter run -d chrome
```

---

## 🌐 Netlify-তে কিভাবে Live করবেন (3টি সহজ উপায়)

`build/web` ফোল্ডারটি ইতিমধ্যে সফলভাবে জেনারেট করা আছে (`fvm flutter build web --release` দিয়ে)।

### পদ্ধতি ১: Netlify Drop (সবচেয়ে সহজ - ১০ সেকেন্ডে লাইভ)

1. ব্রাউজারে যান: **[https://app.netlify.com/drop](https://app.netlify.com/drop)**
2. আপনার প্রজেক্টের এই ফোল্ডারটি সরাসরি টেনে নিয়ে (Drag & Drop) ব্রাউজারে ড্রপ করুন:
   ```
   C:\Flutter\Remon_Portfolio\build\web
   ```
3. সাথে সাথে আপনার সাইট লাইভ হয়ে যাবে এবং একটি লিংক পাবেন (যেমন: `remon-portfolio.netlify.app`)!
4. **Site Settings > Change site name** এ গিয়ে নিজের পছন্দমতো নাম সেট করে নিতে পারেন।

---

### পদ্ধতি ২: Netlify CLI দিয়ে টার্মিনাল থেকেই লাইভ করা

আপনার টার্মিনালে নিচের কমান্ডটি রান করুন:

```bash
npx netlify deploy --prod --dir=build/web
```

- এটি আপনাকে Netlify অ্যাকাউন্টে লগইন করতে বলবে।
- এরপর "Create & configure a new site" নির্বাচন করলে সাথে সাথে লাইভ লিংক চলে আসবে।

---

### পদ্ধতি ৩: GitHub Continuous Deployment (অটোমেটিক আপডেট)

প্রজেক্টে ইতিমধ্যে `.github/workflows/deploy.yml` এবং `netlify.toml` যুক্ত করা হয়েছে।

1. আপনার কোড গিটহাবে পুশ করুন:
   ```bash
   git add .
   git commit -m "feat: complete premium flutter web portfolio with netlify setup"
   git push origin main
   ```
2. **Netlify Dashboard**-এ গিয়ে **Add new site > Import an existing project > GitHub** সিলেক্ট করে `Remon_Portfolio` রিপোজিটরিটি চুজ করুন।
3. Build Settings:
   - **Publish directory**: `build/web`
   - **Build command**: `flutter build web --release` (অথবা GitHub Actions ব্যবহার করলে বিল্ড অটোমেটিক রান হবে)।

---

## 🛠 Project Structure

```
lib/
├── main.dart                          # Web-safe clean app entry
└── portfolio/
    ├── constants/
    │   ├── portfolio_colors.dart      # Dark obsidian & neon accents
    │   └── portfolio_data.dart        # All resume details, projects, skills
    ├── models/
    │   └── portfolio_models.dart      # Data models
    ├── widgets/
    │   ├── common_widgets.dart        # HoverCard, GlowButton, TechChips, Headers
    │   ├── nav_bar.dart               # Responsive glassmorphism navbar & drawer
    │   ├── hero_section.dart          # Hero intro, metrics & tech code terminal
    │   ├── about_section.dart         # Bio & 4 architectural pillars
    │   ├── skills_section.dart        # Filterable skills toolkit
    │   ├── experience_section.dart    # Senior Flutter Developer experience card
    │   ├── projects_section.dart      # Inara Yoga, Sonographer Pal, Al Khalifa cards
    │   ├── education_section.dart     # City University & BITM/Ostad certifications
    │   ├── contact_section.dart       # Form & direct contact links
    │   └── footer_section.dart        # Footer & Back-to-top button
    └── portfolio_screen.dart          # Smooth scroll coordinator
```
