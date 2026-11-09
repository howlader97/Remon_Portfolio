import 'package:flutter/material.dart';
import 'package:flutter_riverpod_template/portfolio/models/portfolio_models.dart';

class PortfolioData {
  PortfolioData._();

  // Personal Info
  static const String name = "Remon Chandra Howlader";
  static const String initials = "RH";
  static const String roleTitle = "Software Engineer (Flutter & Mobile Architecture)";
  static const String email = "remonhowlader97@gmail.com";
  static const String phone = "+8801722877869";
  static const String location = "Dhaka, Bangladesh";
  static const String githubUrl = "https://github.com/howlader97";
  static const String linkedinUrl = "https://linkedin.com/in/chremon1";
  static const String whatsappUrl = "https://wa.me/8801722877869";
  static const String resumeUrl = "https://drive.google.com/file/d/view?usp=sharing";

  static const String professionalSummary =
      "Senior-level Mobile Application Engineer with extensive hands-on experience designing, "
      "scaling, and maintaining high-performance cross-platform applications across iOS and Android. "
      "Expert in Clean Architecture, modular MVVM, Riverpod/Bloc/GetX, complex REST & GraphQL integrations, "
      "and CI/CD pipelines. Proven track record of shipping top-tier apps on App Store and Google Play with "
      "strict focus on UI performance, zero memory leaks, and 60 FPS fluidity.";

  // Quick Stats
  static const List<Map<String, String>> stats = [
    {"label": "Years Exp.", "value": "3+"},
    {"label": "Published Apps", "value": "5+"},
    {"label": "Rendering Fluidity", "value": "60 FPS"},
    {"label": "Clean Architecture", "value": "100%"},
  ];

  // Professional Experience
  static const List<ExperienceItem> experiences = [
    ExperienceItem(
      role: "Senior Flutter Developer",
      company: "MAK Tech Solution",
      period: "01/2025 – Present",
      location: "Dhaka, Bangladesh",
      highlights: [
        "Architect enterprise-grade mobile systems using Clean Architecture, Riverpod, and Bloc; built reusable widget libraries cutting feature delivery time by 30%.",
        "Engineered ultra-low latency real-time streaming modules using LiveKit, WebSockets, and WebRTC with automated fault-tolerant reconnection logic.",
        "Conducted comprehensive code reviews, profiled app memory/battery metrics using Flutter DevTools, and maintained automated GitHub Actions CI/CD pipelines.",
        "Integrated secure multi-channel auth, Stripe/SSLCommerz gateways, and Firebase suite (Auth, Firestore, FCM, Crashlytics) for continuous release monitoring.",
      ],
      techStack: [
        "Flutter",
        "Dart",
        "Riverpod",
        "Bloc",
        "Clean Architecture",
        "LiveKit",
        "WebRTC",
        "WebSockets",
        "Stripe",
        "SSLCommerz",
        "CI/CD",
        "Firebase",
      ],
    ),
  ];

  // Published Projects
  static const List<ProjectItem> projects = [
    ProjectItem(
      title: "Inara Yoga",
      subtitle: "Studio Booking App",
      platform: "iOS App Store",
      platformIcon: Icons.apple,
      badgeColor: Color(0xFF38BDF8),
      storeUrl: "https://apps.apple.com/app/inara-yoga/id6759218108",
      techStack: ["Flutter", "Dart", "REST APIs", "In-App Purchase (StoreKit)", "Firebase FCM"],
      highlights: [
        "Engineered real-time class booking engine with live spot counters, dynamic timetable filtering, and instant push confirmations via FCM.",
        "Integrated Apple In-App Purchases for recurring subscriptions and digital passes, complete with automated session balance calculations.",
        "Profiled rendering pipelines using Xcode Instruments to eradicate frame drops, delivering smooth 60 FPS transitions across varied iOS devices.",
      ],
    ),
    ProjectItem(
      title: "Sonographer Pal",
      subtitle: "Medical EdTech Simulator",
      platform: "Google Play",
      platformIcon: Icons.android_rounded,
      badgeColor: Color(0xFF10B981),
      storeUrl: "https://play.google.com/store/apps/details?id=com.shomosfiotime.app",
      techStack: ["Flutter", "GetX", "RESTful APIs", "Firebase Auth", "RevenueCat IAP"],
      highlights: [
        "Designed end-to-end exam simulator with dynamic mock test timers, background audio flashcards, and encrypted PDF material viewer.",
        "Deployed RevenueCat SDK for server-side validated multi-tier subscriptions, dynamic paywalls, and cross-platform entitlement recovery.",
      ],
    ),
    ProjectItem(
      title: "Al Khalifa Food Delivery",
      subtitle: "On-Demand Food Logistics",
      platform: "Google Play",
      platformIcon: Icons.android_rounded,
      badgeColor: Color(0xFFF59E0B),
      storeUrl: "https://play.google.com/store/apps/details?id=com.alkhalifa.alkhalifa",
      techStack: ["Flutter", "FastAPI", "SSLCommerz", "GetStorage", "Geolocation"],
      highlights: [
        "Architected full-lifecycle food logistics application featuring live catalog browsing, SSLCommerz gateway, and GPS-based fee algorithms.",
        "Enhanced UI rendering through aggressive image precaching and optimized widget trees.",
      ],
    ),
  ];

  // Technical Skills
  static const List<SkillCategory> skillCategories = [
    SkillCategory(
      name: "Core Technologies",
      icon: Icons.code_rounded,
      accentColor: Color(0xFF00D2FF),
      skills: [
        "Flutter",
        "Dart",
        "Android (Java/Kotlin)",
        "iOS (Swift)",
        "C/C++",
        "OOP Principles",
        "Data Structures",
      ],
    ),
    SkillCategory(
      name: "Architecture & State",
      icon: Icons.account_tree_rounded,
      accentColor: Color(0xFF6366F1),
      skills: [
        "Clean Architecture",
        "MVVM",
        "MVC",
        "Bloc",
        "Riverpod",
        "GetX",
        "Provider",
        "Repository Pattern",
        "SOLID Principles",
        "Reusable Widgets",
      ],
    ),
    SkillCategory(
      name: "Backend, Cloud & APIs",
      icon: Icons.cloud_queue_rounded,
      accentColor: Color(0xFF38BDF8),
      skills: [
        "REST APIs",
        "GraphQL",
        "Dio",
        "HTTP/JSON",
        "Firebase Auth",
        "Firestore",
        "FCM",
        "Crashlytics",
        "SQLite",
        "Hive",
        "SharedPrefs",
        "Postman",
      ],
    ),
    SkillCategory(
      name: "Publishing & DevOps",
      icon: Icons.settings_suggest_rounded,
      accentColor: Color(0xFF10B981),
      skills: [
        "App Store Connect",
        "Google Play Console",
        "CI/CD (GitHub Actions)",
        "Git",
        "GitHub",
        "Profiling & DevTools",
        "VS Code",
        "Android Studio",
      ],
    ),
    SkillCategory(
      name: "Integrations & Hardware",
      icon: Icons.bolt_rounded,
      accentColor: Color(0xFFEC4899),
      skills: [
        "Stripe",
        "SSLCommerz",
        "RevenueCat / IAP",
        "Google Maps",
        "Geolocation",
        "WebSockets",
        "LiveKit",
      ],
    ),
  ];

  // Education & Training
  static const List<EducationItem> education = [
    EducationItem(
      degree: "B.Sc. in Computer Science & Engineering",
      institution: "City University",
      period: "12/2018 – 02/2023",
      location: "Dhaka, Bangladesh",
      score: "3.16 / 4.0",
      scoreLabel: "CGPA",
    ),
  ];

  static const List<TrainingItem> training = [
    TrainingItem(
      title: "Mastering Flutter for Mobile Apps Development",
      institution: "Bangladesh Institute of IT Management (BITM)",
      period: "March 2025 – June 2025",
    ),
    TrainingItem(
      title: "App Development with Flutter",
      institution: "Ostad Ltd.",
      period: "April 2023 – October 2023",
    ),
  ];
}
