import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod_template/portfolio/constants/portfolio_colors.dart';
import 'package:flutter_riverpod_template/portfolio/constants/portfolio_data.dart';
import 'package:flutter_riverpod_template/portfolio/widgets/common_widgets.dart';

class FooterSection extends StatelessWidget {
  final Function(String section) onNavTap;

  const FooterSection({
    super.key,
    required this.onNavTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: PortfolioColors.backgroundSecondary,
        border: Border(
          top: BorderSide(color: PortfolioColors.border, width: 1),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 60 : 20,
        vertical: 40,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          gradient: PortfolioColors.primaryGradient,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          PortfolioData.initials,
                          style: GoogleFonts.firaCode(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            PortfolioData.name,
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: PortfolioColors.textPrimary,
                            ),
                          ),
                          Text(
                            "Flutter & Mobile Architect",
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              color: PortfolioColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Back to Top button
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => onNavTap("hero"),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: PortfolioColors.surface,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: PortfolioColors.border),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.arrow_upward_rounded,
                              size: 14,
                              color: PortfolioColors.primary,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              "Back to Top",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: PortfolioColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Divider(color: PortfolioColors.border),
              const SizedBox(height: 20),
              isDesktop
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildCopyright(),
                        _buildSocialRow(),
                      ],
                    )
                  : Column(
                      children: [
                        _buildCopyright(),
                        const SizedBox(height: 16),
                        _buildSocialRow(),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCopyright() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Built with ",
          style: GoogleFonts.poppins(
            fontSize: 13,
            color: PortfolioColors.textSecondary,
          ),
        ),
        const Icon(
          Icons.favorite_rounded,
          size: 14,
          color: Colors.redAccent,
        ),
        Text(
          " using Flutter Web • © 2026 Remon Chandra Howlader",
          style: GoogleFonts.poppins(
            fontSize: 13,
            color: PortfolioColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          tooltip: "GitHub",
          icon: const Icon(Icons.terminal_rounded, size: 18),
          color: PortfolioColors.textSecondary,
          onPressed: () => UrlHelper.launchWebUrl(PortfolioData.githubUrl),
        ),
        IconButton(
          tooltip: "LinkedIn",
          icon: const Icon(Icons.badge_outlined, size: 18),
          color: PortfolioColors.textSecondary,
          onPressed: () => UrlHelper.launchWebUrl(PortfolioData.linkedinUrl),
        ),
        IconButton(
          tooltip: "Facebook",
          icon: const Icon(Icons.facebook, size: 18),
          color: PortfolioColors.textSecondary,
          onPressed: () => UrlHelper.launchWebUrl(PortfolioData.facebookUrl),
        ),
        IconButton(
          tooltip: "Email",
          icon: const Icon(Icons.mail_outline_rounded, size: 18),
          color: PortfolioColors.textSecondary,
          onPressed: () => UrlHelper.launchMail(PortfolioData.email),
        ),
      ],
    );
  }
}
