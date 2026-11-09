import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod_template/portfolio/constants/portfolio_colors.dart';
import 'package:flutter_riverpod_template/portfolio/constants/portfolio_data.dart';
import 'package:flutter_riverpod_template/portfolio/models/portfolio_models.dart';
import 'package:flutter_riverpod_template/portfolio/widgets/common_widgets.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

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
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              const SectionHeader(
                tag: "// 03. Professional Experience",
                title: "Engineering Leadership & Experience",
                subtitle:
                    "Demonstrated history of architecting production systems, optimizing runtime performance, and shipping high-value features.",
              ),
              ...PortfolioData.experiences
                  .map((exp) => _buildExperienceCard(context, exp)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceCard(BuildContext context, ExperienceItem exp) {
    return HoverCard(
      padding: const EdgeInsets.all(32),
      borderRadius: 20,
      borderColor: PortfolioColors.borderGlow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  gradient: PortfolioColors.primaryGradient,
                  borderRadius: BorderRadius.circular(14),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.work_outline_rounded,
                  color: Color(0xFF070B13),
                  size: 26,
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exp.role,
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: PortfolioColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          exp.company,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: PortfolioColors.primary,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "• ${exp.location}",
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: PortfolioColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Period Badge
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: PortfolioColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: PortfolioColors.primary.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.event_available_rounded,
                      size: 14,
                      color: PortfolioColors.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      exp.period,
                      style: GoogleFonts.firaCode(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: PortfolioColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Divider(color: PortfolioColors.border),
          const SizedBox(height: 20),

          // Bullet points
          ...exp.highlights.map((bullet) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      width: 7,
                      height: 7,
                      decoration: const BoxDecoration(
                        color: PortfolioColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        bullet,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: PortfolioColors.textSecondary,
                          height: 1.65,
                        ),
                      ),
                    ),
                  ],
                ),
              )),

          const SizedBox(height: 16),
          // Tech Stack chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: exp.techStack
                .map((tech) => TechChip(label: tech, isSmall: true))
                .toList(),
          ),
        ],
      ),
    );
  }
}
