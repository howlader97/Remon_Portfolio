import 'package:flutter/material.dart';

class PortfolioColors {
  PortfolioColors._();

  // Backgrounds
  static const Color background = Color(0xFF0077B6); // The user's requested canvas background #0077B6
  static const Color backgroundSecondary = Color(0xFF021835); // Deep midnight navy for footer & modal
  static const Color surface = Color(0xFF031938); // Deep luxury navy for cards
  static const Color surfaceElevated = Color(0xFF06254F);
  static const Color surfaceGlass = Color(0xDD031938);

  // Borders
  static const Color border = Color(0xFF0E4B7D);
  static const Color borderGlow = Color(0xFF00B4D8);
  static const Color borderHighlight = Color(0xFF90E0EF);

  // Accents
  static const Color primary = Color(0xFF00B4D8); // Electric sky blue accent
  static const Color primaryLight = Color(0xFF90E0EF); // Soft luminous cyan
  static const Color secondary = Color(0xFF03045E); // Deep royal navy
  static const Color accent = Color(0xFF48CAE4);
  static const Color accentGreen = Color(0xFF10B981);
  static const Color accentAmber = Color(0xFFF59E0B);
  static const Color accentPink = Color(0xFFEC4899);

  // Page text colors (Directly on #0077B6 background)
  static const Color pageTextPrimary = Color(0xFFFFFFFF); // Crisp pure white
  static const Color pageTextSecondary = Color(0xFFCAF0F8); // Very soft ice blue
  static const Color pageTextMuted = Color(0xFF90E0EF);

  // Card text colors (Inside dark cards)
  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFF64748B);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF0077B6), Color(0xFF0096C7), Color(0xFF00B4D8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient heroHeadingGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFE0F7FA), Color(0xFF90E0EF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient glowGradient = LinearGradient(
    colors: [Color(0x3300B4D8), Color(0x1A0077B6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF031938), Color(0xFF021226)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const RadialGradient heroRadial = RadialGradient(
    colors: [Color(0x3390E0EF), Colors.transparent],
    radius: 0.9,
  );
}
