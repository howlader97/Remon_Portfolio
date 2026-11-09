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

  // Top Published Applications (Live on Stores)
  static const List<ProjectItem> publishedProjects = [
    ProjectItem(
      title: "Sonographer Pal",
      subtitle: "Medical Learning Application",
      platform: "Google Play Store",
      platformIcon: Icons.android_rounded,
      badgeColor: Color(0xFF10B981),
      storeUrl: "https://play.google.com/store/apps/details?id=com.shomoshotime.app&hl=en",
      storeButtonText: "Google Play",
      description:
          "Sonographer Pal is a production-ready Flutter application designed for sonography students, "
          "educators, and healthcare professionals. The app provides an accessible learning platform with "
          "educational resources, helping users improve their knowledge and practical understanding of medical sonography.",
      keyFeatures: [
        "Educational platform tailored for sonography learning and professional development.",
        "Secure user authentication and profile management.",
        "REST API integration for dynamic content and data synchronization.",
        "Responsive and intuitive UI optimized for a seamless learning experience.",
        "Performance-focused architecture for scalability and maintainability.",
        "Published on the Google Play Store with ongoing maintenance, feature enhancements, and bug fixes.",
      ],
      responsibilities: [
        "Developed and maintained the complete Flutter application.",
        "Designed and implemented responsive, user-friendly interfaces.",
        "Integrated REST APIs to deliver dynamic educational content.",
        "Implemented secure authentication and application state management using GetX.",
        "Optimized application performance and resolved production issues.",
        "Published the app on the Google Play Store and continued supporting it with regular updates, feature improvements, and bug fixes.",
      ],
      techStack: ["Flutter", "Dart", "GetX", "REST API", "HTTP", "Firebase", "Git & GitHub"],
    ),
    ProjectItem(
      title: "Inara Yoga",
      subtitle: "Studio Booking App",
      platform: "iOS App Store",
      platformIcon: Icons.apple,
      badgeColor: Color(0xFF38BDF8),
      storeUrl: "https://apps.apple.com/app/inara-yoga/id6759218108",
      storeButtonText: "App Store",
      description:
          "A premium iOS studio booking application engineered for high-performance class scheduling, "
          "real-time spot reservations, and recurring memberships.",
      keyFeatures: [
        "Engineered real-time class booking engine with live spot counters and dynamic timetable filtering.",
        "Instant push notification confirmations and class reminders via Firebase Cloud Messaging (FCM).",
        "Integrated Apple In-App Purchases (StoreKit) for recurring subscriptions and digital session passes.",
        "Automated session balance calculations and wallet pass synchronization.",
        "Profiled rendering pipelines using Xcode Instruments to eradicate frame drops, delivering smooth 60 FPS transitions across all iOS devices.",
      ],
      responsibilities: [
        "Architected end-to-end iOS application architecture using Clean Architecture principles.",
        "Implemented Apple StoreKit In-App Purchases and recurring subscription lifecycle management.",
        "Optimized rendering performance to maintain constant 60 FPS with zero memory leaks.",
        "Published and deployed the application to Apple App Store Connect.",
      ],
      techStack: ["Flutter", "Dart", "REST APIs", "StoreKit (IAP)", "Firebase FCM", "Xcode Instruments"],
    ),
    ProjectItem(
      title: "Al Khalifa Food Delivery",
      subtitle: "On-Demand Food Logistics",
      platform: "Google Play Store",
      platformIcon: Icons.android_rounded,
      badgeColor: Color(0xFFF59E0B),
      storeUrl: "https://play.google.com/store/apps/details?id=com.alkhalifa.alkhalifa",
      storeButtonText: "Google Play",
      description:
          "A full-lifecycle food logistics mobile application featuring live menu catalog browsing, "
          "automated ordering workflows, SSLCommerz online payments, and real-time GPS fee calculations.",
      keyFeatures: [
        "Live restaurant catalog browsing with category filtering and instant search.",
        "Integrated SSLCommerz payment gateway for multi-channel secure payments in Bangladesh.",
        "Dynamic GPS-based delivery fee calculations and live driver location tracking.",
        "Aggressive image precaching and optimized widget rendering tree.",
        "Offline-ready local caching using GetStorage for instant repeat order placements.",
      ],
      responsibilities: [
        "Architected frontend mobile architecture integrated with FastAPI backend.",
        "Integrated SSLCommerz payment gateway with callback handling and invoice verification.",
        "Engineered real-time GPS geolocation and delivery fee estimation algorithms.",
        "Optimized image precaching reducing memory footprint by 35% on low-end Android devices.",
        "Published and maintained the production application on Google Play Console.",
      ],
      techStack: ["Flutter", "FastAPI", "SSLCommerz", "GetStorage", "Geolocation", "Google Maps"],
    ),
  ];

  // Enterprise Systems, In-Development & Plugin Projects
  static const List<ProjectItem> otherProjects = [
    ProjectItem(
      title: "Nexprime",
      subtitle: "Multi-Vendor E-Commerce App",
      platform: "E-Commerce & LiveKit",
      platformIcon: Icons.shopping_bag_outlined,
      badgeColor: Color(0xFF00D2FF),
      storeUrl: null,
      storeButtonText: "View Details",
      description:
          "A feature-rich multi-vendor e-commerce mobile application where both vendors and customers "
          "can buy and sell products through a unified platform. The application provides a seamless shopping "
          "experience with secure payments, real-time communication, and live product showcasing.",
      keyFeatures: [
        "Multi-role system with Customer and Vendor accounts.",
        "Customers can browse, purchase, and also become sellers by listing their own products.",
        "Vendors can manage their stores, upload products, and host live streaming sessions to showcase products in real time.",
        "Built-in real-time messaging system for direct communication between customers and vendors.",
        "Secure online payments powered by Stripe Payment Gateway.",
        "Product browsing with categories, search, and detailed product information.",
        "Shopping cart, wishlist, and order management.",
        "User authentication and profile management.",
        "Responsive and user-friendly UI designed for a smooth shopping experience.",
      ],
      responsibilities: [
        "Architected multi-vendor e-commerce application using Riverpod for robust scalable state management.",
        "Integrated LiveKit real-time interactive video streaming for live vendor product showcases.",
        "Built real-time messaging channel for direct vendor-customer communication.",
        "Implemented secure Stripe payment gateway for seamless online checkout transactions.",
        "Engineered responsive and intuitive UI optimized across all device form factors.",
      ],
      techStack: ["Flutter", "Riverpod", "LiveKit", "Stripe", "REST API", "Git & GitHub"],
    ),
    ProjectItem(
      title: "InstaLive",
      subtitle: "Live Streaming & Social Commerce",
      platform: "Real-Time Streaming App",
      platformIcon: Icons.videocam_outlined,
      badgeColor: Color(0xFF8B5CF6),
      storeUrl: null,
      storeButtonText: "View Details",
      description:
          "InstaLive is a Flutter-based live streaming application that enables creators and businesses "
          "to engage with their audience through real-time video streaming. The app also includes secure "
          "payments, instant messaging, and a scalable architecture for a seamless user experience.",
      keyFeatures: [
        "Real-time live video streaming powered by LiveKit.",
        "One-to-one real-time messaging system.",
        "Secure online payments integrated with Stripe Payment Gateway.",
        "User authentication and profile management.",
        "Interactive live streaming experience with audience engagement.",
        "Responsive and modern UI optimized for mobile devices.",
        "Scalable and maintainable project structure using Get CLI Architecture.",
      ],
      responsibilities: [
        "Developed the complete Flutter application using GetX for state management.",
        "Implemented real-time live streaming with LiveKit.",
        "Built the in-app messaging system for seamless communication.",
        "Integrated Stripe for secure payment processing.",
        "Structured the project using Get CLI Architecture for better scalability and maintainability.",
        "Connected the application with backend APIs and optimized performance for a smooth user experience.",
      ],
      techStack: ["Flutter", "Dart", "GetX", "Get CLI", "LiveKit", "Stripe", "REST API", "Git & GitHub"],
    ),
    ProjectItem(
      title: "Flutter Modular Architecture & Plugin Kit",
      subtitle: "Reusable Component Ecosystem",
      platform: "Architecture & Plugin Toolkit",
      platformIcon: Icons.extension_outlined,
      badgeColor: Color(0xFFEC4899),
      storeUrl: "https://github.com/howlader97",
      storeButtonText: "GitHub",
      description:
          "Enterprise-grade reusable widget libraries, state management foundation templates (Riverpod/Bloc/GetX), "
          "and modular utility plugins designed to cut feature delivery time by 30% with zero memory leaks.",
      keyFeatures: [
        "Modular UI system with responsive glassmorphic cards, custom formatters, and reactive listeners.",
        "Reusable Clean Architecture foundation templates with unified repository patterns.",
        "Pre-configured fault-tolerant real-time WebSocket and streaming connectors.",
        "Automated CI/CD pipelines and testing harnesses configured with GitHub Actions.",
      ],
      responsibilities: [
        "Engineered and maintained reusable Flutter architectural libraries.",
        "Standardized Clean Architecture and MVVM patterns across development teams.",
        "Maintained open-source modules and shared utilities on GitHub.",
      ],
      techStack: ["Flutter", "Dart", "Clean Architecture", "Riverpod", "Bloc", "GetX", "CI/CD"],
    ),
  ];

  // Combined all projects list for easy future additions
  static List<ProjectItem> get allProjects => [...publishedProjects, ...otherProjects];

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
