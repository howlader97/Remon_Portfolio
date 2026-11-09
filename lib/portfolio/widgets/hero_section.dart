import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod_template/portfolio/constants/portfolio_colors.dart';
import 'package:flutter_riverpod_template/portfolio/constants/portfolio_data.dart';
import 'package:flutter_riverpod_template/portfolio/widgets/common_widgets.dart';

class HeroSection extends StatelessWidget {
  final Function(String section) onNavTap;

  const HeroSection({
    super.key,
    required this.onNavTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 680),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 60 : 20,
        vertical: isDesktop ? 60 : 36,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 6, child: _buildContent(context, true)),
                    const SizedBox(width: 48),
                    Expanded(flex: 5, child: _buildHeroCard(context, true)),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildContent(context, false),
                    const SizedBox(height: 40),
                    _buildHeroCard(context, false),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Live Availability Pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: PortfolioColors.pageTextPrimary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: PortfolioColors.pageTextPrimary.withValues(alpha: 0.25),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 9,
                height: 9,
                decoration: const BoxDecoration(
                  color: PortfolioColors.accentGreen,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: PortfolioColors.accentGreen,
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "Available for New Projects & Opportunities",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: PortfolioColors.pageTextPrimary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Intro
        Text(
          "Hello, I'm",
          style: GoogleFonts.poppins(
            fontSize: isDesktop ? 22 : 18,
            fontWeight: FontWeight.w600,
            color: PortfolioColors.pageTextSecondary,
          ),
        ),
        const SizedBox(height: 6),

        // Name with gradient shader
        ShaderMask(
          shaderCallback: (bounds) =>
              PortfolioColors.heroHeadingGradient.createShader(bounds),
          child: Text(
            PortfolioData.name,
            style: GoogleFonts.poppins(
              fontSize: isDesktop ? 48 : 34,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: -1.0,
              height: 1.15,
            ),
          ),
        ),
        const SizedBox(height: 14),

        // Role title
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: PortfolioColors.primary.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: PortfolioColors.primary.withValues(alpha: 0.35),
            ),
          ),
          child: Text(
            PortfolioData.roleTitle,
            style: GoogleFonts.firaCode(
              fontSize: isDesktop ? 15 : 13,
              fontWeight: FontWeight.w700,
              color: PortfolioColors.primary,
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Professional Summary
        Text(
          PortfolioData.professionalSummary,
          style: GoogleFonts.poppins(
            fontSize: isDesktop ? 15 : 14,
            fontWeight: FontWeight.w500,
            color: PortfolioColors.pageTextSecondary,
            height: 1.75,
          ),
        ),
        const SizedBox(height: 32),

        // CTA Buttons
        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            GlowButton(
              text: "Explore Projects",
              icon: Icons.layers_outlined,
              accentColor: PortfolioColors.primary,
              onPressed: () => onNavTap("projects"),
            ),
            GlowButton(
              text: "Contact Me",
              icon: Icons.mail_outline_rounded,
              isOutlined: true,
              accentColor: PortfolioColors.pageTextPrimary,
              onPressed: () => onNavTap("contact"),
            ),
            GlowButton(
              text: "View GitHub",
              icon: Icons.terminal_rounded,
              isOutlined: true,
              accentColor: PortfolioColors.pageTextPrimary,
              onPressed: () => UrlHelper.launchWebUrl(PortfolioData.githubUrl),
            ),
          ],
        ),
        const SizedBox(height: 32),

        // Social Icons row
        Row(
          children: [
            SocialIconButton(
              icon: FontAwesomeIcons.github,
              tooltip: "GitHub Profile",
              onTap: () => UrlHelper.launchWebUrl(PortfolioData.githubUrl),
              accentColor: PortfolioColors.pageTextPrimary,
            ),
            const SizedBox(width: 12),
            SocialIconButton(
              icon: FontAwesomeIcons.linkedin,
              tooltip: "LinkedIn Profile",
              onTap: () => UrlHelper.launchWebUrl(PortfolioData.linkedinUrl),
              accentColor: const Color(0xFF0A66C2),
            ),
            const SizedBox(width: 12),
            SocialIconButton(
              icon: Icons.facebook,
              tooltip: "Facebook Profile",
              onTap: () => UrlHelper.launchWebUrl(PortfolioData.facebookUrl),
              accentColor: const Color(0xFF1877F2),
            ),
            const SizedBox(width: 12),
            SocialIconButton(
              icon: Icons.mail_outline_rounded,
              tooltip: "Email Me",
              onTap: () => UrlHelper.launchMail(PortfolioData.email),
              accentColor: PortfolioColors.accentAmber,
            ),
            const SizedBox(width: 12),
            SocialIconButton(
              icon: FontAwesomeIcons.whatsapp,
              tooltip: "Chat on WhatsApp",
              onTap: () => UrlHelper.launchWebUrl(PortfolioData.whatsappUrl),
              accentColor: const Color(0xFF25D366),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeroCard(BuildContext context, bool isDesktop) {
    final imageHeight = isDesktop ? 370.0 : 310.0;

    return HoverCard(
      borderRadius: 24,
      padding: const EdgeInsets.all(24),
      borderColor: PortfolioColors.borderGlow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Professional Profile Image
          Container(
            height: imageHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: PortfolioColors.primaryLight.withValues(alpha: 0.4),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: PortfolioColors.primaryLight.withValues(alpha: 0.15),
                  blurRadius: 26,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.5),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    "assets/images/remon111.jpg",
                    fit: BoxFit.cover,
                    alignment: const Alignment(0.0, -0.6),
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: PortfolioColors.surfaceElevated,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.person_rounded,
                          size: 64,
                          color: PortfolioColors.primaryLight,
                        ),
                      );
                    },
                  ),
                  // Subtle bottom gradient vignette
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 80,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            PortfolioColors.surface.withValues(alpha: 0.85),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  // Floating name tag badge
                  Positioned(
                    bottom: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: PortfolioColors.surface.withValues(alpha: 0.92),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: PortfolioColors.primaryLight.withValues(alpha: 0.4),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 7,
                            height: 7,
                            decoration: const BoxDecoration(
                              color: PortfolioColors.accentGreen,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            PortfolioData.name,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: PortfolioColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),

          // 3+ Years Experience Highlight Card
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            decoration: BoxDecoration(
              color: PortfolioColors.surfaceElevated,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: PortfolioColors.primaryLight.withValues(alpha: 0.35),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: PortfolioColors.primaryLight.withValues(alpha: 0.12),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: PortfolioColors.primaryGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.workspace_premium_rounded,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "3+",
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: PortfolioColors.primaryLight,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Years Experience",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: PortfolioColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Senior Flutter & Mobile Application Architecture",
                        style: GoogleFonts.poppins(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w500,
                          color: PortfolioColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
