import 'package:flutter/material.dart';

class ProjectItem {
  final String title;
  final String subtitle;
  final String platform; // "iOS", "Android", "Cross-Platform"
  final IconData platformIcon;
  final String? storeUrl;
  final String? githubUrl;
  final List<String> techStack;
  final List<String> highlights;
  final bool isFeatured;
  final Color badgeColor;

  const ProjectItem({
    required this.title,
    required this.subtitle,
    required this.platform,
    required this.platformIcon,
    this.storeUrl,
    this.githubUrl,
    required this.techStack,
    required this.highlights,
    this.isFeatured = true,
    this.badgeColor = const Color(0xFF00D2FF),
  });
}

class ExperienceItem {
  final String role;
  final String company;
  final String period;
  final String location;
  final List<String> highlights;
  final List<String> techStack;

  const ExperienceItem({
    required this.role,
    required this.company,
    required this.period,
    required this.location,
    required this.highlights,
    required this.techStack,
  });
}

class SkillCategory {
  final String name;
  final IconData icon;
  final List<String> skills;
  final Color accentColor;

  const SkillCategory({
    required this.name,
    required this.icon,
    required this.skills,
    this.accentColor = const Color(0xFF00D2FF),
  });
}

class EducationItem {
  final String degree;
  final String institution;
  final String period;
  final String location;
  final String? score;
  final String? scoreLabel;

  const EducationItem({
    required this.degree,
    required this.institution,
    required this.period,
    required this.location,
    this.score,
    this.scoreLabel,
  });
}

class TrainingItem {
  final String title;
  final String institution;
  final String period;

  const TrainingItem({
    required this.title,
    required this.institution,
    required this.period,
  });
}

