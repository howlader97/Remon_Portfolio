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

  const PortfolioNavBar({
    super.key,
    required this.onNavTap,
    required this.onOpenDrawer,
    this.isScrolled = false,
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
              // Brand Monogram
              _buildBrand(context),

              // Desktop Navigation Links
              if (isDesktop) ...[
                Row(
                  children: [
                    _NavLink(title: "About", onTap: () => onNavTap("about")),
                    _NavLink(title: "Skills", onTap: () => onNavTap("skills")),
                    _NavLink(title: "Experience", onTap: () => onNavTap("experience")),
                    _NavLink(title: "Projects", onTap: () => onNavTap("projects")),
                    _NavLink(title: "Education", onTap: () => onNavTap("education")),
                    _NavLink(title: "Contact", onTap: () => onNavTap("contact")),
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
                    color: PortfolioColors.textPrimary,
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

  Widget _buildBrand(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onNavTap("hero"),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                gradient: PortfolioColors.primaryGradient,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: PortfolioColors.primary.withValues(alpha: 0.4),
                    blurRadius: 14,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                PortfolioData.initials,
                style: GoogleFonts.firaCode(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFF070B13),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  PortfolioData.name,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: PortfolioColors.textPrimary,
                    letterSpacing: -0.2,
                  ),
                ),
                Text(
                  "Flutter & Mobile Architect",
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: PortfolioColors.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavLink({
    required this.title,
    required this.onTap,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 180),
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
              color: _isHovered
                  ? PortfolioColors.primary
                  : PortfolioColors.textSecondary,
            ),
            child: Text(widget.title),
          ),
        ),
      ),
    );
  }
}

class MobileDrawer extends StatelessWidget {
  final Function(String section) onNavTap;

  const MobileDrawer({
    super.key,
    required this.onNavTap,
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
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: Icon(icon, size: 20, color: PortfolioColors.primary),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: PortfolioColors.textPrimary,
        ),
      ),
      onTap: () {
        Navigator.of(context).pop();
        onNavTap(section);
      },
    );
  }
}
