import 'package:flutter/material.dart';
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

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  bool _isScrolled = false;

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
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(String section) {
    GlobalKey? targetKey;
    switch (section) {
      case "hero":
        targetKey = _heroKey;
        break;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: PortfolioColors.background,
      endDrawer: MobileDrawer(onNavTap: _scrollToSection),
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
      body: Stack(
        children: [
          // Main Scrollable Content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 74), // Spacing for floating navbar
                Container(
                  key: _heroKey,
                  child: HeroSection(onNavTap: _scrollToSection),
                ),
                Container(
                  key: _aboutKey,
                  child: const AboutSection(),
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
              onNavTap: _scrollToSection,
              onOpenDrawer: () => _scaffoldKey.currentState?.openEndDrawer(),
            ),
          ),
        ],
      ),
    );
  }
}
