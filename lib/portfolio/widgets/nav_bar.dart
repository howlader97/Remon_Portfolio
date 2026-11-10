import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod_template/portfolio/constants/portfolio_colors.dart';
import 'package:flutter_riverpod_template/portfolio/constants/portfolio_data.dart';
import 'package:flutter_riverpod_template/portfolio/widgets/common_widgets.dart';

class PortfolioNavBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String section) onNavTap;
  final VoidCallback onOpenDrawer;
  final bool isScrolled;
  final String activeSection;

  const PortfolioNavBar({
    super.key,
    required this.onNavTap,
    required this.onOpenDrawer,
    this.isScrolled = false,
    this.activeSection = "home",
  });

  @override
  Size get preferredSize => const Size.fromHeight(74);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 960;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          height: 74,
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 48 : 20,
          ),
          decoration: BoxDecoration(
            color: isScrolled
                ? PortfolioColors.background.withValues(alpha: 0.88)
                : PortfolioColors.background.withValues(alpha: 0.55),
            border: Border(
              bottom: BorderSide(
                color: isScrolled
                    ? PortfolioColors.border
                    : Colors.transparent,
                width: 1,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left side empty as requested
              const SizedBox.shrink(),

              // Desktop Navigation Links
              if (isDesktop) ...[
                Row(
                  children: [
                    _NavLink(
                      title: "Home",
                      isSelected: activeSection.toLowerCase() == "home",
                      onTap: () => onNavTap("home"),
                    ),
                    _NavLink(
                      title: "About",
                      isSelected: activeSection.toLowerCase() == "about",
                      onTap: () => onNavTap("about"),
                    ),
                    _NavLink(
                      title: "Skills",
                      isSelected: activeSection.toLowerCase() == "skills",
                      onTap: () => onNavTap("skills"),
                    ),
                    _NavLink(
                      title: "Experience",
                      isSelected: activeSection.toLowerCase() == "experience",
                      onTap: () => onNavTap("experience"),
                    ),
                    _NavLink(
                      title: "Projects",
                      isSelected: activeSection.toLowerCase() == "projects",
                      onTap: () => onNavTap("projects"),
                    ),
                    _NavLink(
                      title: "Education",
                      isSelected: activeSection.toLowerCase() == "education",
                      onTap: () => onNavTap("education"),
                    ),
                    _NavLink(
                      title: "Contact",
                      isSelected: activeSection.toLowerCase() == "contact",
                      onTap: () => onNavTap("contact"),
                    ),
                  ],
                ),
                // Action Buttons
                Row(
                  children: [
                    GlowButton(
                      text: "Get in Touch",
                      icon: Icons.send_rounded,
                      onPressed: () => onNavTap("contact"),
                      verticalPadding: 10,
                      horizontalPadding: 18,
                    ),
                  ],
                ),
              ] else ...[
                // Mobile Menu Toggle
                IconButton(
                  onPressed: onOpenDrawer,
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: PortfolioColors.pageTextPrimary,
                    size: 28,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavLink({
    required this.title,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final active = widget.isSelected;
    const activeColor = PortfolioColors.primary;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: active
                ? activeColor.withValues(alpha: 0.12)
                : (_isHovered
                    ? activeColor.withValues(alpha: 0.06)
                    : Colors.transparent),
            borderRadius: BorderRadius.circular(10),
            border: active
                ? Border.all(
                    color: activeColor.withValues(alpha: 0.45),
                    width: 1.2,
                  )
                : Border.all(color: Colors.transparent, width: 1.2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 180),
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: active
                      ? FontWeight.w700
                      : (_isHovered ? FontWeight.w600 : FontWeight.w500),
                  color: active
                      ? activeColor
                      : (_isHovered
                          ? PortfolioColors.primaryLight
                          : PortfolioColors.pageTextPrimary),
                ),
                child: Text(widget.title),
              ),
              const SizedBox(height: 3),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2.5,
                width: active ? 22 : (_isHovered ? 12 : 0),
                decoration: BoxDecoration(
                  color: activeColor,
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: active
                      ? [
                          BoxShadow(
                            color: activeColor.withValues(alpha: 0.65),
                            blurRadius: 6,
                            spreadRadius: 1,
                          ),
                        ]
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileDrawer extends StatelessWidget {
  final Function(String section) onNavTap;
  final String activeSection;

  const MobileDrawer({
    super.key,
    required this.onNavTap,
    this.activeSection = "home",
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: PortfolioColors.backgroundSecondary,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          gradient: PortfolioColors.primaryGradient,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          PortfolioData.initials,
                          style: GoogleFonts.firaCode(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: const Color(0xFF070B13),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Navigation",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: PortfolioColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.close_rounded,
                      color: PortfolioColors.textSecondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Divider(color: PortfolioColors.border),
              const SizedBox(height: 16),
              _drawerItem(context, "Home", "home", Icons.home_outlined),
              _drawerItem(context, "About", "about", Icons.person_outline_rounded),
              _drawerItem(context, "Skills", "skills", Icons.code_rounded),
              _drawerItem(context, "Experience", "experience", Icons.work_outline_rounded),
              _drawerItem(context, "Projects", "projects", Icons.layers_outlined),
              _drawerItem(context, "Education", "education", Icons.school_outlined),
              _drawerItem(context, "Contact", "contact", Icons.mail_outline_rounded),
              const Spacer(),
              GlowButton(
                text: "Get In Touch",
                icon: Icons.send_rounded,
                onPressed: () {
                  Navigator.of(context).pop();
                  onNavTap("contact");
                },
                horizontalPadding: double.infinity,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem(
    BuildContext context,
    String title,
    String section,
    IconData icon,
  ) {
    final active = activeSection.toLowerCase() == section.toLowerCase();
    const activeColor = PortfolioColors.primary;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        color: active
            ? activeColor.withValues(alpha: 0.12)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: active
            ? Border.all(color: activeColor.withValues(alpha: 0.4), width: 1.2)
            : null,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
        leading: Icon(
          icon,
          size: 20,
          color: active ? activeColor : PortfolioColors.primary,
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: active ? FontWeight.w700 : FontWeight.w500,
            color: active ? activeColor : PortfolioColors.textPrimary,
          ),
        ),
        trailing: active
            ? Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  color: activeColor,
                  shape: BoxShape.circle,
                ),
              )
            : null,
        onTap: () {
          Navigator.of(context).pop();
          onNavTap(section);
        },
      ),
    );
  }
}
