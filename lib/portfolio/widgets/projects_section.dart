import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod_template/portfolio/constants/portfolio_colors.dart';
import 'package:flutter_riverpod_template/portfolio/constants/portfolio_data.dart';
import 'package:flutter_riverpod_template/portfolio/models/portfolio_models.dart';
import 'package:flutter_riverpod_template/portfolio/widgets/common_widgets.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  void _showProjectDetails(BuildContext context, ProjectItem project) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.75),
      builder: (ctx) => ProjectDetailsDialog(project: project),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 680 && screenWidth < 1024;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 60 : 20,
        vertical: 70,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1250),
          child: Column(
            children: [
              const SectionHeader(
                tag: "// 04. Featured Projects",
                title: "Published Applications & Systems",
                subtitle:
                    "Production-ready mobile applications architected from ground up. Tap on any card for full architecture overview, key features, and engineering responsibilities.",
              ),

              // Horizontal 3-card layout on desktop
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: PortfolioData.projects.map((project) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: _ProjectCard(
                          project: project,
                          onCardTap: () => _showProjectDetails(context, project),
                        ),
                      ),
                    );
                  }).toList(),
                )
              else if (isTablet)
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: PortfolioData.projects.map((project) {
                    final cardWidth = (screenWidth - 80) / 2;
                    return SizedBox(
                      width: cardWidth,
                      child: _ProjectCard(
                        project: project,
                        onCardTap: () => _showProjectDetails(context, project),
                      ),
                    );
                  }).toList(),
                )
              else
                Column(
                  children: PortfolioData.projects.map((project) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: _ProjectCard(
                        project: project,
                        onCardTap: () => _showProjectDetails(context, project),
                      ),
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final ProjectItem project;
  final VoidCallback onCardTap;

  const _ProjectCard({
    required this.project,
    required this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      padding: const EdgeInsets.all(24),
      borderRadius: 20,
      borderColor: project.badgeColor.withValues(alpha: 0.35),
      glowColor: project.badgeColor,
      onTap: onCardTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Platform badge + Direct Store Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Platform tag
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                        size: 14, color: project.badgeColor),
                    const SizedBox(width: 6),
                    Text(
                      project.platform,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: project.badgeColor,
                      ),
                    ),
                  ],
                ),
              ),

              // Direct Store Button (Tapping this opens link directly, without dialog)
              if (project.storeUrl != null)
                GestureDetector(
                  onTap: () => UrlHelper.launchWebUrl(project.storeUrl!),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: project.badgeColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: project.badgeColor,
                        width: 1.2,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(project.platformIcon,
                            size: 13, color: project.badgeColor),
                        const SizedBox(width: 6),
                        Text(
                          project.storeButtonText ?? "Store",
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: project.badgeColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 18),

          // Title & Subtitle
          Text(
            project.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: PortfolioColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            project.subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: project.badgeColor,
            ),
          ),
          const SizedBox(height: 14),

          // Short Description
          Text(
            project.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: PortfolioColors.textSecondary,
              height: 1.55,
            ),
          ),
          const SizedBox(height: 18),
          const Divider(color: PortfolioColors.border),
          const SizedBox(height: 14),

          // Tech Stack chips (first 4)
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              ...project.techStack.take(4).map((tech) {
                return TechChip(
                  label: tech,
                  color: project.badgeColor,
                  isSmall: true,
                );
              }),
              if (project.techStack.length > 4)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: PortfolioColors.surfaceElevated,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "+${project.techStack.length - 4}",
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: PortfolioColors.textMuted,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 18),

          // View Details Action Link
          Row(
            children: [
              Text(
                "Tap for full details",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: project.badgeColor,
                ),
              ),
              const SizedBox(width: 6),
              Icon(
                Icons.arrow_forward_rounded,
                size: 14,
                color: project.badgeColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectDetailsDialog extends StatelessWidget {
  final ProjectItem project;

  const ProjectDetailsDialog({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final dialogWidth = screenWidth > 820 ? 780.0 : screenWidth * 0.92;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Container(
            width: dialogWidth,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.88,
            ),
            decoration: BoxDecoration(
              color: PortfolioColors.backgroundSecondary.withValues(alpha: 0.96),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: project.badgeColor.withValues(alpha: 0.4),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: project.badgeColor.withValues(alpha: 0.25),
                  blurRadius: 36,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Modal Header
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                  decoration: BoxDecoration(
                    color: PortfolioColors.surface,
                    border: const Border(
                      bottom: BorderSide(color: PortfolioColors.border, width: 1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color:
                                    project.badgeColor.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                project.platformIcon,
                                color: project.badgeColor,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    project.title,
                                    style: GoogleFonts.poppins(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: PortfolioColors.textPrimary,
                                    ),
                                  ),
                                  Text(
                                    project.subtitle,
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: project.badgeColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.close_rounded,
                          color: PortfolioColors.textSecondary,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),

                // Modal Scrollable Content
                Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Overview
                        Text(
                          "Overview",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: PortfolioColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          project.description,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: PortfolioColors.textSecondary,
                            height: 1.65,
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Divider(color: PortfolioColors.border),
                        const SizedBox(height: 20),

                        // Key Features
                        Text(
                          "Key Features",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: PortfolioColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...project.keyFeatures.map((feature) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: project.badgeColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    feature,
                                    style: GoogleFonts.poppins(
                                      fontSize: 13.5,
                                      color: PortfolioColors.textSecondary,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),

                        // My Responsibilities (if present)
                        if (project.responsibilities.isNotEmpty) ...[
                          const SizedBox(height: 20),
                          const Divider(color: PortfolioColors.border),
                          const SizedBox(height: 20),
                          Text(
                            "My Responsibilities & Engineering Role",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: PortfolioColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ...project.responsibilities.map((resp) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.check_circle_outline_rounded,
                                    size: 16,
                                    color: project.badgeColor,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      resp,
                                      style: GoogleFonts.poppins(
                                        fontSize: 13.5,
                                        color: PortfolioColors.textSecondary,
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ],

                        const SizedBox(height: 20),
                        const Divider(color: PortfolioColors.border),
                        const SizedBox(height: 20),

                        // Tech Stack
                        Text(
                          "Tech Stack & Architecture",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: PortfolioColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: project.techStack.map((tech) {
                            return TechChip(
                              label: tech,
                              color: project.badgeColor,
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),

                // Modal Footer
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                  decoration: BoxDecoration(
                    color: PortfolioColors.surface,
                    border: const Border(
                      top: BorderSide(color: PortfolioColors.border, width: 1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (project.storeUrl != null)
                        GlowButton(
                          text: "Open on ${project.storeButtonText ?? 'Store'}",
                          icon: project.platformIcon,
                          accentColor: project.badgeColor,
                          onPressed: () =>
                              UrlHelper.launchWebUrl(project.storeUrl!),
                        )
                      else
                        Text(
                          "Status: In Production / Architecture Showcase",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            color: PortfolioColors.textMuted,
                          ),
                        ),
                      GlowButton(
                        text: "Close",
                        isOutlined: true,
                        accentColor: PortfolioColors.textSecondary,
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
