import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod_template/portfolio/constants/portfolio_colors.dart';
import 'package:flutter_riverpod_template/portfolio/constants/portfolio_data.dart';
import 'package:flutter_riverpod_template/portfolio/models/portfolio_models.dart';
import 'package:flutter_riverpod_template/portfolio/widgets/common_widgets.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  int _selectedCategoryIndex = -1; // -1 means "All"

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 640 && screenWidth < 1024;

    final categoriesToShow = _selectedCategoryIndex == -1
        ? PortfolioData.skillCategories
        : [PortfolioData.skillCategories[_selectedCategoryIndex]];

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
                tag: "// 02. Technical Skills",
                title: "Tech Stack & Engineering Toolkit",
                subtitle:
                    "Core languages, state management architectures, cloud infrastructures, and DevOps pipelines leveraged across production apps.",
              ),

              // Filter Chips
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: [
                  _filterButton("All Categories", -1),
                  ...List.generate(
                    PortfolioData.skillCategories.length,
                    (index) => _filterButton(
                      PortfolioData.skillCategories[index].name,
                      index,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 36),

              // Category Cards
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 1;
                  if (isDesktop && _selectedCategoryIndex == -1) {
                    crossAxisCount = 3;
                  } else if (isTablet || _selectedCategoryIndex != -1) {
                    crossAxisCount = isDesktop ? 2 : 1;
                  }

                  if (crossAxisCount == 1) {
                    return Column(
                      children: categoriesToShow
                          .map((cat) => Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: _buildSkillCategoryCard(cat),
                              ))
                          .toList(),
                    );
                  }

                  return Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: categoriesToShow.map((cat) {
                      final width = (constraints.maxWidth -
                              (crossAxisCount - 1) * 20) /
                          crossAxisCount;
                      return SizedBox(
                        width: width,
                        child: _buildSkillCategoryCard(cat),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _filterButton(String label, int index) {
    final isSelected = _selectedCategoryIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedCategoryIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? PortfolioColors.primary
              : PortfolioColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? PortfolioColors.primary
                : PortfolioColors.border,
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected
                ? const Color(0xFF070B13)
                : PortfolioColors.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildSkillCategoryCard(SkillCategory category) {
    return HoverCard(
      borderColor: category.accentColor.withValues(alpha: 0.25),
      glowColor: category.accentColor,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: category.accentColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  category.icon,
                  color: category.accentColor,
                  size: 18,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  category.name,
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: PortfolioColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Divider(color: PortfolioColors.border),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: category.skills.map((skill) {
              return TechChip(
                label: skill,
                color: category.accentColor,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
