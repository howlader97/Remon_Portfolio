import 'package:flutter/material.dart';

class PortfolioColors {
  PortfolioColors._();

  // Backgrounds - premium dark oceanic blue matching user's reference
  static const Color background = Color(0xFF080E18);
  static const Color backgroundSecondary = Color(0xFF050A10);
  static const Color surface = Color(0xFF0D1726);
  static const Color surfaceElevated = Color(0xFF132238);
  static const Color surfaceGlass = Color(0xEE0D1726);

  // Borders
  static const Color border = Color(0xFF1E3352);
  static const Color borderGlow = Color(0xFF38BDF8);
  static const Color borderHighlight = Color(0xFF00D2FF);

  // Accents
  static const Color primary = Color(0xFF00D2FF); // Electric cyan
  static const Color primaryLight = Color(0xFF38BDF8);
  static const Color secondary = Color(0xFF0F2B48);
  static const Color accent = Color(0xFF00D2FF);
  static const Color accentGreen = Color(0xFF10B981);
  static const Color accentAmber = Color(0xFFF59E0B);
  static const Color accentPink = Color(0xFFEC4899);

  // Page text colors
  static const Color pageTextPrimary = Color(0xFFFFFFFF);
  static const Color pageTextSecondary = Color(0xFF94A3B8);
  static const Color pageTextMuted = Color(0xFF64748B);

  // Card text colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFF64748B);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF0077B6), Color(0xFF00B4D8), Color(0xFF00D2FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient heroHeadingGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFE0F7FA), Color(0xFF38BDF8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient glowGradient = LinearGradient(
    colors: [Color(0x3300D2FF), Color(0x1A080E18)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF0D1726), Color(0xFF080E18)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const RadialGradient heroRadial = RadialGradient(
    colors: [Color(0x3300D2FF), Colors.transparent],
    radius: 0.9,
  );
}
