import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod_template/portfolio/constants/portfolio_colors.dart';
import 'package:flutter_riverpod_template/portfolio/constants/portfolio_data.dart';
import 'package:flutter_riverpod_template/portfolio/widgets/about_section.dart';
import 'package:flutter_riverpod_template/portfolio/widgets/common_widgets.dart';
import 'package:flutter_riverpod_template/portfolio/widgets/contact_section.dart';
import 'package:flutter_riverpod_template/portfolio/widgets/education_section.dart';
import 'package:flutter_riverpod_template/portfolio/widgets/experience_section.dart';
import 'package:flutter_riverpod_template/portfolio/widgets/footer_section.dart';
import 'package:flutter_riverpod_template/portfolio/widgets/hero_section.dart';
import 'package:flutter_riverpod_template/portfolio/widgets/nav_bar.dart';
import 'package:flutter_riverpod_template/portfolio/widgets/projects_section.dart';
import 'package:flutter_riverpod_template/portfolio/widgets/skills_section.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  bool _isScrolled = false;
  String _activeSection = "home";

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.offset > 50 && !_isScrolled) {
      setState(() => _isScrolled = true);
    } else if (_scrollController.offset <= 50 && _isScrolled) {
      setState(() => _isScrolled = false);
    }
    _determineActiveSection();
  }

  void _determineActiveSection() {
    final sections = [
      {"name": "home", "key": _homeKey},
      {"name": "about", "key": _aboutKey},
      {"name": "skills", "key": _skillsKey},
      {"name": "experience", "key": _experienceKey},
      {"name": "projects", "key": _projectsKey},
      {"name": "education", "key": _educationKey},
      {"name": "contact", "key": _contactKey},
    ];

    String detected = "home";
    for (final sec in sections) {
      final key = sec["key"] as GlobalKey;
      final ctx = key.currentContext;
      if (ctx != null) {
        final box = ctx.findRenderObject() as RenderBox?;
        if (box != null && box.hasSize) {
          final top = box.localToGlobal(Offset.zero).dy;
          if (top <= 250) {
            detected = sec["name"] as String;
          }
        }
      }
    }
    if (_activeSection != detected) {
      setState(() => _activeSection = detected);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(String section) {
    final sec = section.toLowerCase();
    setState(() => _activeSection = (sec == "hero" ? "about" : sec));

    GlobalKey? targetKey;
    switch (sec) {
      case "home":
        targetKey = _homeKey;
        break;
      case "hero":
      case "about":
        targetKey = _aboutKey;
        break;
      case "skills":
        targetKey = _skillsKey;
        break;
      case "experience":
        targetKey = _experienceKey;
        break;
      case "projects":
        targetKey = _projectsKey;
        break;
      case "education":
        targetKey = _educationKey;
        break;
      case "contact":
        targetKey = _contactKey;
        break;
    }

    if (targetKey?.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey!.currentContext!,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  Widget _buildBannerImage(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: isDesktop ? 60 : 20,
        right: isDesktop ? 60 : 20,
        top: isDesktop ? 18 : 12,
        bottom: isDesktop ? 8 : 4,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isDesktop ? 22 : 14),
              border: Border.all(
                color: PortfolioColors.primaryLight.withValues(alpha: 0.35),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: PortfolioColors.primary.withValues(alpha: 0.22),
                  blurRadius: 32,
                  offset: const Offset(0, 8),
                ),
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.40),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isDesktop ? 20.5 : 12.5),
              child: Image.asset(
                "assets/images/bannar_images.jpg",
                width: double.infinity,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/images/bannar_image.jpg",
                    width: double.infinity,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    errorBuilder: (c, e, s) => const SizedBox.shrink(),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFlutterHighlights(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 640 && screenWidth < 1024;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 60 : 20,
        vertical: isDesktop ? 20 : 14,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: PortfolioColors.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: PortfolioColors.primary.withValues(alpha: 0.35),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.flutter_dash,
                      color: PortfolioColors.primary,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "CROSS-PLATFORM EXCELLENCE",
                      style: GoogleFonts.firaCode(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w700,
                        color: PortfolioColors.primary,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              Text(
                "Why Flutter & Modern Mobile Application Architecture",
                style: GoogleFonts.poppins(
                  fontSize: isDesktop ? 36 : 24,
                  fontWeight: FontWeight.w900,
                  color: PortfolioColors.pageTextPrimary,
                  letterSpacing: -0.8,
                  height: 1.25,
                ),
              ),
              const SizedBox(height: 12),

              Text(
                "Flutter eliminates traditional cross-platform compromises by compiling directly to native ARM machine code with Google's high-performance Impeller rendering engine. "
                "With a single unified codebase, businesses achieve 50% faster time-to-market across iOS and Android, pixel-perfect UI consistency, and rock-solid 60/120 FPS fluid performance.",
                style: GoogleFonts.poppins(
                  fontSize: isDesktop ? 16 : 14,
                  fontWeight: FontWeight.w500,
                  color: PortfolioColors.pageTextSecondary,
                  height: 1.7,
                ),
              ),
              const SizedBox(height: 20),

              // 4 Core Architecture & App Development Pillars
              LayoutBuilder(
                builder: (context, constraints) {
                  final crossAxisCount = isDesktop ? 4 : (isTablet ? 2 : 1);
                  return GridView.count(
                    crossAxisCount: crossAxisCount,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: isDesktop ? 1.35 : (isTablet ? 1.55 : 2.3),
                    children: [
                      _flutterFeatureCard(
                        icon: Icons.devices_rounded,
                        title: "Single Codebase, Native ARM",
                        description:
                            "One unified Dart codebase compiling directly to native binaries for iOS & Android with zero OEM bridge overhead.",
                        accentColor: PortfolioColors.primary,
                      ),
                      _flutterFeatureCard(
                        icon: Icons.speed_rounded,
                        title: "60/120 FPS Fluidity",
                        description:
                            "Impeller graphics pipeline delivering silky-smooth animations, pre-compiled shaders, and zero frame drops.",
                        accentColor: PortfolioColors.accentGreen,
                      ),
                      _flutterFeatureCard(
                        icon: Icons.account_tree_outlined,
                        title: "Modular Clean State",
                        description:
                            "Scalable state management using Riverpod, BLoC, and GetX, enforcing strictly decoupled, 100% testable logic.",
                        accentColor: PortfolioColors.accentAmber,
                      ),
                      _flutterFeatureCard(
                        icon: Icons.cloud_done_outlined,
                        title: "Cloud & Real-Time Sync",
                        description:
                            "End-to-end integration of Firebase suite, REST/GraphQL APIs, LiveKit real-time WebRTC, and payment gateways.",
                        accentColor: PortfolioColors.accentPink,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _flutterFeatureCard({
    required IconData icon,
    required String title,
    required String description,
    required Color accentColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: PortfolioColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: accentColor.withValues(alpha: 0.25),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: accentColor,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w700,
                    color: PortfolioColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: GoogleFonts.poppins(
              fontSize: 11.5,
              fontWeight: FontWeight.w400,
              color: PortfolioColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: PortfolioColors.background,
      endDrawer: MobileDrawer(
        onNavTap: _scrollToSection,
        activeSection: _activeSection,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: PortfolioColors.primary,
        foregroundColor: Colors.white,
        elevation: 6,
        onPressed: () => UrlHelper.launchWebUrl(PortfolioData.whatsappUrl),
        icon: const Icon(Icons.chat_bubble_outline_rounded, size: 18),
        label: const Text(
          "WhatsApp",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF163554), // Lighter, vibrant royal oceanic blue at top
              Color(0xFF112A44),
              Color(0xFF0E2338), // Rich royal navy
              Color(0xFF0A1B2C),
            ],
            stops: [0.0, 0.25, 0.65, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // Simple premium top ambient spotlight / glow
            Positioned(
              top: -150,
              left: 0,
              right: 0,
              child: Center(
                child: IgnorePointer(
                  child: Container(
                    width: 900,
                    height: 500,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          Color(0x3000D2FF), // Soft luminous light
                          Color(0x100077B6),
                          Colors.transparent,
                        ],
                        stops: const [0.0, 0.45, 1.0],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Soft mid-page ambient light behind projects
            Positioned(
              top: 1400,
              right: -150,
              child: IgnorePointer(
                child: Container(
                  width: 550,
                  height: 550,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Color(0x1500D2FF),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Main Scrollable Content
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
              children: [
                const SizedBox(height: 74), // Spacing for floating navbar
                Container(
                  key: _homeKey,
                  child: Column(
                    children: [
                      _buildBannerImage(context),
                      _buildFlutterHighlights(context),
                    ],
                  ),
                ),
                Container(
                  key: _aboutKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width >= 1024 ? 60 : 36,
                          left: MediaQuery.of(context).size.width >= 1024 ? 60 : 20,
                          right: MediaQuery.of(context).size.width >= 1024 ? 60 : 20,
                        ),
                        child: const Center(
                          child: SectionHeader(
                            tag: "// 01. About Me",
                            title: "Engineering Scalable, Production-Grade Systems",
                            subtitle:
                                "A deep dive into my professional track record, architectural philosophy, and cross-platform mobile engineering standards.",
                            isCenter: true,
                          ),
                        ),
                      ),
                      HeroSection(onNavTap: _scrollToSection),
                      const AboutSection(),
                    ],
                  ),
                ),
                Container(
                  key: _skillsKey,
                  child: const SkillsSection(),
                ),
                Container(
                  key: _experienceKey,
                  child: const ExperienceSection(),
                ),
                Container(
                  key: _projectsKey,
                  child: const ProjectsSection(),
                ),
                Container(
                  key: _educationKey,
                  child: const EducationSection(),
                ),
                Container(
                  key: _contactKey,
                  child: const ContactSection(),
                ),
                FooterSection(onNavTap: _scrollToSection),
              ],
            ),
          ),

          // Sticky Top Navigation Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: PortfolioNavBar(
              isScrolled: _isScrolled,
              activeSection: _activeSection,
              onNavTap: _scrollToSection,
              onOpenDrawer: () => _scaffoldKey.currentState?.openEndDrawer(),
            ),
          ),
        ],
      ),
    ),
  );
  }
}
