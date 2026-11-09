import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod_template/portfolio/constants/portfolio_colors.dart';
import 'package:flutter_riverpod_template/portfolio/constants/portfolio_data.dart';
import 'package:flutter_riverpod_template/portfolio/models/portfolio_models.dart';
import 'package:flutter_riverpod_template/portfolio/widgets/common_widgets.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 60 : 20,
        vertical: 70,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              const SectionHeader(
                tag: "// 04. Featured Projects",
                title: "Published Applications",
                subtitle:
                    "Production-ready mobile applications architected from ground up and actively deployed on App Store and Google Play.",
              ),
              ...PortfolioData.projects.map((project) => Padding(
                    padding: const EdgeInsets.only(bottom: 28),
                    child: _buildProjectCard(context, project, isDesktop),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard(
      BuildContext context, ProjectItem project, bool isDesktop) {
    return HoverCard(
      padding: const EdgeInsets.all(32),
      borderRadius: 22,
      borderColor: project.badgeColor.withValues(alpha: 0.35),
      glowColor: project.badgeColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Platform Badge + Store Action
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: project.badgeColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: project.badgeColor.withValues(alpha: 0.35),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(project.platformIcon,
                        size: 15, color: project.badgeColor),
                    const SizedBox(width: 8),
                    Text(
                      project.platform,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: project.badgeColor,
                      ),
                    ),
                  ],
                ),
              ),
              if (project.storeUrl != null)
                GlowButton(
                  text: project.platform.contains("iOS")
                      ? "App Store"
                      : "Google Play",
                  icon: project.platformIcon,
                  accentColor: project.badgeColor,
                  isOutlined: true,
                  horizontalPadding: 16,
                  verticalPadding: 8,
                  onPressed: () => UrlHelper.launchWebUrl(project.storeUrl!),
                ),
            ],
          ),
          const SizedBox(height: 18),

          // Title & Subtitle
          Text(
            project.title,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: PortfolioColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            project.subtitle,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: PortfolioColors.primary,
            ),
          ),
          const SizedBox(height: 18),
          const Divider(color: PortfolioColors.border),
          const SizedBox(height: 16),

          // Bullet Highlights
          ...project.highlights.map((bullet) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: project.badgeColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        bullet,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: PortfolioColors.textSecondary,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
              )),

          const SizedBox(height: 18),
          // Tech Stack chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: project.techStack.map((tech) {
              return TechChip(
                label: tech,
                color: project.badgeColor,
                isSmall: true,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
