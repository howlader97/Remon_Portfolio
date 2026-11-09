import 'package:flutter/material.dart';
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
        vertical: isDesktop ? 70 : 40,
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
                    Expanded(flex: 5, child: _buildHeroCard(context)),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildContent(context, false),
                    const SizedBox(height: 48),
                    _buildHeroCard(context),
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
            color: PortfolioColors.accentGreen.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: PortfolioColors.accentGreen.withValues(alpha: 0.35),
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
                  fontWeight: FontWeight.w600,
                  color: PortfolioColors.accentGreen,
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
            fontWeight: FontWeight.w500,
            color: PortfolioColors.textSecondary,
          ),
        ),
        const SizedBox(height: 6),

        // Name with gradient shader
        ShaderMask(
          shaderCallback: (bounds) =>
              PortfolioColors.primaryGradient.createShader(bounds),
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
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: PortfolioColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: PortfolioColors.primary.withValues(alpha: 0.3),
            ),
          ),
          child: Text(
            PortfolioData.roleTitle,
            style: GoogleFonts.firaCode(
              fontSize: isDesktop ? 15 : 13,
              fontWeight: FontWeight.w600,
              color: PortfolioColors.primary,
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Subtitle / Bio
        Text(
          PortfolioData.professionalSummary,
          style: GoogleFonts.poppins(
            fontSize: isDesktop ? 15 : 14,
            fontWeight: FontWeight.w400,
            color: PortfolioColors.textSecondary,
            height: 1.7,
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
              onPressed: () => onNavTap("projects"),
            ),
            GlowButton(
              text: "Contact Me",
              icon: Icons.mail_outline_rounded,
              isOutlined: true,
              onPressed: () => onNavTap("contact"),
            ),
            GlowButton(
              text: "View GitHub",
              icon: Icons.terminal_rounded,
              isOutlined: true,
              accentColor: PortfolioColors.textSecondary,
              onPressed: () => UrlHelper.launchWebUrl(PortfolioData.githubUrl),
            ),
          ],
        ),
        const SizedBox(height: 32),

        // Social Icons row
        Row(
          children: [
            SocialIconButton(
              icon: Icons.terminal_rounded,
              tooltip: "GitHub Profile",
              onTap: () => UrlHelper.launchWebUrl(PortfolioData.githubUrl),
            ),
            const SizedBox(width: 12),
            SocialIconButton(
              icon: Icons.badge_outlined,
              tooltip: "LinkedIn Profile",
              onTap: () => UrlHelper.launchWebUrl(PortfolioData.linkedinUrl),
              accentColor: const Color(0xFF0A66C2),
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
              icon: Icons.chat_bubble_outline_rounded,
              tooltip: "Chat on WhatsApp",
              onTap: () => UrlHelper.launchWebUrl(PortfolioData.whatsappUrl),
              accentColor: PortfolioColors.accentGreen,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeroCard(BuildContext context) {
    return HoverCard(
      borderRadius: 24,
      padding: const EdgeInsets.all(32),
      borderColor: PortfolioColors.borderGlow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEF4444),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF59E0B),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: Color(0xFF10B981),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: PortfolioColors.surfaceElevated,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "profile.dart",
                  style: GoogleFonts.firaCode(
                    fontSize: 12,
                    color: PortfolioColors.textMuted,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Code-style architecture banner
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: PortfolioColors.backgroundSecondary,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: PortfolioColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCodeLine("class", " RemonPortfolio ", "extends", " SeniorEngineer {"),
                const SizedBox(height: 4),
                _buildCodeLine("  final architecture = ", "'Clean Architecture & MVVM';", "", ""),
                const SizedBox(height: 4),
                _buildCodeLine("  final state = ", "[Riverpod, Bloc, GetX];", "", ""),
                const SizedBox(height: 4),
                _buildCodeLine("  final focus = ", "'60 FPS Fluidity & Zero Leaks';", "", ""),
                const SizedBox(height: 4),
                _buildCodeLine("  final location = ", "'Dhaka, Bangladesh';", "", ""),
                const SizedBox(height: 4),
                _buildCodeLine("}", "", "", ""),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Metrics 2x2 Grid
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 1.8,
            children: PortfolioData.stats.map((stat) {
              return Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: PortfolioColors.surfaceElevated,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: PortfolioColors.primary.withValues(alpha: 0.15),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      stat["value"]!,
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: PortfolioColors.primary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      stat["label"]!,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: PortfolioColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeLine(String kw, String name, String kw2, String rest) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.firaCode(fontSize: 12, height: 1.5),
        children: [
          TextSpan(
            text: kw,
            style: const TextStyle(color: Color(0xFFF43F5E), fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: name,
            style: const TextStyle(color: Color(0xFF38BDF8)),
          ),
          if (kw2.isNotEmpty)
            TextSpan(
              text: kw2,
              style: const TextStyle(color: Color(0xFFF43F5E), fontWeight: FontWeight.bold),
            ),
          TextSpan(
            text: rest,
            style: const TextStyle(color: Color(0xFFE2E8F0)),
          ),
        ],
      ),
    );
  }
}
