import 'package:flutter/material.dart';

class PortfolioColors {
  PortfolioColors._();

  // Backgrounds
  static const Color background = Color(0xFF080C15);
  static const Color backgroundSecondary = Color(0xFF0D1424);
  static const Color surface = Color(0xFF131D31);
  static const Color surfaceElevated = Color(0xFF1A2640);
  static const Color surfaceGlass = Color(0xCC111B2E);

  // Borders
  static const Color border = Color(0xFF1E2D4A);
  static const Color borderGlow = Color(0xFF2E4574);
  static const Color borderHighlight = Color(0xFF38BDF8);

  // Accents
  static const Color primary = Color(0xFF00D2FF); // Cyan / Flutter blue
  static const Color primaryDark = Color(0xFF0090D0);
  static const Color secondary = Color(0xFF6366F1); // Indigo / Violet
  static const Color accent = Color(0xFF38BDF8); // Sky blue
  static const Color accentGreen = Color(0xFF10B981); // Emerald / Live status
  static const Color accentAmber = Color(0xFFF59E0B);
  static const Color accentPink = Color(0xFFEC4899);

  // Text colors
  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFF64748B);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF00D2FF), Color(0xFF3B82F6), Color(0xFF6366F1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient glowGradient = LinearGradient(
    colors: [Color(0x3300D2FF), Color(0x1A6366F1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF131D31), Color(0xFF0F1728)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const RadialGradient heroRadial = RadialGradient(
    colors: [Color(0x3300D2FF), Colors.transparent],
    radius: 0.9,
  );
}
