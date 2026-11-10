import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod_template/portfolio/constants/portfolio_colors.dart';
import 'package:flutter_riverpod_template/portfolio/constants/portfolio_data.dart';
import 'package:flutter_riverpod_template/portfolio/widgets/common_widgets.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

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
                tag: "// 05. Education & Training",
                title: "Academic Background & Certifications",
                subtitle:
                    "Solid computer science foundations reinforced with continuous hands-on masterclasses.",
              ),
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildEducationCard(context)),
                    const SizedBox(width: 32),
                    Expanded(child: _buildTrainingCard(context)),
                  ],
                )
              else
                Column(
                  children: [
                    _buildEducationCard(context),
                    const SizedBox(height: 32),
                    _buildTrainingCard(context),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEducationCard(BuildContext context) {
    final edu = PortfolioData.education.first;

    return HoverCard(
      padding: const EdgeInsets.all(28),
      borderColor: PortfolioColors.primary.withValues(alpha: 0.3),
      glowColor: PortfolioColors.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: PortfolioColors.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.school_outlined,
                  color: PortfolioColors.primary,
                  size: 22,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  "Formal Education",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: PortfolioColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: PortfolioColors.border),
          const SizedBox(height: 18),
          Text(
            edu.degree,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: PortfolioColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            edu.institution,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: PortfolioColors.primary,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                size: 13,
                color: PortfolioColors.textMuted,
              ),
              const SizedBox(width: 8),
              Text(
                edu.period,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: PortfolioColors.textSecondary,
                ),
              ),
              const SizedBox(width: 16),
              const Icon(
                Icons.place_outlined,
                size: 13,
                color: PortfolioColors.textMuted,
              ),
              const SizedBox(width: 8),
              Text(
                edu.location,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: PortfolioColors.textSecondary,
                ),
              ),
            ],
          ),
          if (edu.score != null) ...[
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: PortfolioColors.surfaceElevated,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: PortfolioColors.border),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${edu.scoreLabel}: ",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: PortfolioColors.textSecondary,
                    ),
                  ),
                  Text(
                    edu.score!,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: PortfolioColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTrainingCard(BuildContext context) {
    return HoverCard(
      padding: const EdgeInsets.all(28),
      borderColor: PortfolioColors.primaryLight.withValues(alpha: 0.35),
      glowColor: PortfolioColors.primaryLight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: PortfolioColors.primaryLight.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: PortfolioColors.primaryLight.withValues(alpha: 0.35),
                  ),
                ),
                child: const Icon(
                  Icons.verified_rounded,
                  color: PortfolioColors.primaryLight,
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  "Professional Training",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: PortfolioColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: PortfolioColors.border),
          const SizedBox(height: 18),
          ...PortfolioData.training.map((train) => Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      train.title,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: PortfolioColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      train.institution,
                      style: GoogleFonts.poppins(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w600,
                        color: PortfolioColors.primaryLight,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_outlined,
                          size: 13,
                          color: PortfolioColors.textMuted,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          train.period,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: PortfolioColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
