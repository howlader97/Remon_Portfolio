import 'package:flutter/material.dart';

class PortfolioColors {
  PortfolioColors._();

  // Backgrounds - strictly #012A4A as requested
  static const Color background = Color(0xFF012A4A);
  static const Color backgroundSecondary = Color(0xFF012A4A);
  static const Color surface = Color(0xFF013A63);
  static const Color surfaceElevated = Color(0xFF014F86);
  static const Color surfaceGlass = Color(0xEE013A63);

  // Borders
  static const Color border = Color(0xFF014F86);
  static const Color borderGlow = Color(0xFF2A6F97);
  static const Color borderHighlight = Color(0xFF468FAF);

  // Accents
  static const Color primary = Color(0xFF2A6F97);
  static const Color primaryLight = Color(0xFF89C2D9);
  static const Color secondary = Color(0xFF013A63);
  static const Color accent = Color(0xFF468FAF);
  static const Color accentGreen = Color(0xFF10B981);
  static const Color accentAmber = Color(0xFFF59E0B);
  static const Color accentPink = Color(0xFFEC4899);

  // Page text colors (Directly on #012A4A background)
  static const Color pageTextPrimary = Color(0xFFFFFFFF);
  static const Color pageTextSecondary = Color(0xFFE2E8F0);
  static const Color pageTextMuted = Color(0xFFA9D6E5);

  // Card text colors (Inside dark cards)
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFE2E8F0);
  static const Color textMuted = Color(0xFFA9D6E5);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF013A63), Color(0xFF014F86), Color(0xFF2A6F97)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient heroHeadingGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFE2E8F0), Color(0xFFA9D6E5)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient glowGradient = LinearGradient(
    colors: [Color(0x332A6F97), Color(0x1A012A4A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF013A63), Color(0xFF012A4A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const RadialGradient heroRadial = RadialGradient(
    colors: [Color(0x332A6F97), Colors.transparent],
    radius: 0.9,
  );
}
