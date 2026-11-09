import 'package:flutter/material.dart';

class PortfolioColors {
  PortfolioColors._();

  // Backgrounds
  static const Color background = Color(0xFF90E0EF); // The user's requested canvas background
  static const Color backgroundSecondary = Color(0xFF071224); // Deep navy for footer & modal
  static const Color surface = Color(0xFF0B172E); // Deep luxury navy for cards
  static const Color surfaceElevated = Color(0xFF10203E);
  static const Color surfaceGlass = Color(0xEE0B172E);

  // Borders
  static const Color border = Color(0xFF1E355B);
  static const Color borderGlow = Color(0xFF2E518A);
  static const Color borderHighlight = Color(0xFF00B4D8);

  // Accents
  static const Color primary = Color(0xFF0077B6);
  static const Color primaryLight = Color(0xFF00B4D8);
  static const Color secondary = Color(0xFF03045E);
  static const Color accent = Color(0xFF0096C7);
  static const Color accentGreen = Color(0xFF10B981);
  static const Color accentAmber = Color(0xFFF59E0B);
  static const Color accentPink = Color(0xFFEC4899);

  // Page text colors (Directly on #90E0EF background)
  static const Color pageTextPrimary = Color(0xFF03045E);
  static const Color pageTextSecondary = Color(0xFF0F2642);
  static const Color pageTextMuted = Color(0xFF1E3D60);

  // Card text colors (Inside dark cards)
  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFF64748B);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF023E8A), Color(0xFF0077B6), Color(0xFF0096C7)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient heroHeadingGradient = LinearGradient(
    colors: [Color(0xFF03045E), Color(0xFF023E8A), Color(0xFF0077B6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient glowGradient = LinearGradient(
    colors: [Color(0x330077B6), Color(0x1A03045E)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF0B172E), Color(0xFF071120)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const RadialGradient heroRadial = RadialGradient(
    colors: [Color(0x3300B4D8), Colors.transparent],
    radius: 0.9,
  );
}
