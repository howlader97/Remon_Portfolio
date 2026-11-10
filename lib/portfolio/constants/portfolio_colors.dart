import 'package:flutter/material.dart';

class PortfolioColors {
  PortfolioColors._();

  // Backgrounds - lighter, rich royal oceanic blue requested by user
  static const Color background = Color(0xFF0E2338);
  static const Color backgroundSecondary = Color(0xFF091827);
  static const Color surface = Color(0xFF132B45);
  static const Color surfaceElevated = Color(0xFF1B3A5C);
  static const Color surfaceGlass = Color(0xDD132B45);

  // Borders
  static const Color border = Color(0xFF264C72);
  static const Color borderGlow = Color(0xFF38BDF8);
  static const Color borderHighlight = Color(0xFF00D2FF);

  // Accents
  static const Color primary = Color(0xFF00D2FF); // Electric cyan
  static const Color primaryLight = Color(0xFF38BDF8);
  static const Color secondary = Color(0xFF38BDF8); // Vibrant Sky Blue
  static const Color accent = Color(0xFF00D2FF);
  static const Color accentGreen = Color(0xFF10B981);
  static const Color accentAmber = Color(0xFFF59E0B);
  static const Color accentPink = Color(0xFFEC4899);

  // Page text colors
  static const Color pageTextPrimary = Color(0xFFFFFFFF);
  static const Color pageTextSecondary = Color(0xFFCBD5E1);
  static const Color pageTextMuted = Color(0xFF94A3B8);

  // Card text colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFCBD5E1);
  static const Color textMuted = Color(0xFF94A3B8);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF0284C7), Color(0xFF0EA5E9), Color(0xFF38BDF8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient heroHeadingGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFE0F7FA), Color(0xFF38BDF8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient glowGradient = LinearGradient(
    colors: [Color(0x3300D2FF), Color(0x1A0E2338)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF132B45), Color(0xFF0E2338)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const RadialGradient heroRadial = RadialGradient(
    colors: [Color(0x3300D2FF), Colors.transparent],
    radius: 0.9,
  );
}
