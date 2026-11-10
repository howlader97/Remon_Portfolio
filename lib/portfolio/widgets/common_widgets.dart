import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod_template/portfolio/constants/portfolio_colors.dart';

class UrlHelper {
  static Future<void> launchWebUrl(String urlString) async {
    try {
      final Uri uri = Uri.parse(urlString);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      }
    } catch (e) {
      debugPrint("Error launching URL: $e");
    }
  }

  static Future<void> launchMail(String email) async {
    final Uri uri = Uri(scheme: 'mailto', path: email);
    try {
      await launchUrl(uri);
    } catch (e) {
      debugPrint("Error launching mail: $e");
    }
  }

  static Future<void> launchTel(String phone) async {
    final Uri uri = Uri(scheme: 'tel', path: phone);
    try {
      await launchUrl(uri);
    } catch (e) {
      debugPrint("Error launching tel: $e");
    }
  }
}

class SectionHeader extends StatelessWidget {
  final String tag;
  final String title;
  final String? subtitle;
  final bool isCenter;

  const SectionHeader({
    super.key,
    required this.tag,
    required this.title,
    this.subtitle,
    this.isCenter = true,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;

    return Column(
      crossAxisAlignment:
          isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Tag Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: PortfolioColors.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: PortfolioColors.primary.withValues(alpha: 0.40),
              width: 1.2,
            ),
          ),
          child: Text(
            tag.toUpperCase(),
            style: GoogleFonts.firaCode(
              fontSize: isDesktop ? 15.5 : 13.5,
              fontWeight: FontWeight.w700,
              color: PortfolioColors.primary,
              letterSpacing: 2.2,
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Title
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 880),
          child: Text(
            title,
            textAlign: isCenter ? TextAlign.center : TextAlign.start,
            style: GoogleFonts.poppins(
              fontSize: isDesktop ? 32 : 24,
              fontWeight: FontWeight.w700,
              color: PortfolioColors.pageTextPrimary,
              letterSpacing: -0.5,
              height: 1.3,
            ),
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Text(
              subtitle!,
              textAlign: isCenter ? TextAlign.center : TextAlign.start,
              style: GoogleFonts.poppins(
                fontSize: isDesktop ? 15 : 13.5,
                fontWeight: FontWeight.w500,
                color: PortfolioColors.pageTextSecondary,
                height: 1.6,
              ),
            ),
          ),
        ],
        const SizedBox(height: 36),
      ],
    );
  }
}

class HoverCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final VoidCallback? onTap;
  final Color? borderColor;
  final Color? glowColor;

  const HoverCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius = 16,
    this.onTap,
    this.borderColor,
    this.glowColor,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final activeGlow = widget.glowColor ?? PortfolioColors.primary;
    final activeBorder = widget.borderColor ?? PortfolioColors.border;

    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          margin: widget.margin,
          padding: widget.padding ?? const EdgeInsets.all(24),
          transform: Matrix4.translationValues(0.0, _isHovered ? -6.0 : 0.0, 0.0),
          decoration: BoxDecoration(
            color: _isHovered
                ? PortfolioColors.surfaceElevated
                : PortfolioColors.surface,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(
              color: _isHovered
                  ? activeGlow.withValues(alpha: 0.6)
                  : activeBorder,
              width: _isHovered ? 1.4 : 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? activeGlow.withValues(alpha: 0.22)
                    : Colors.black.withValues(alpha: 0.35),
                blurRadius: _isHovered ? 24 : 12,
                offset: Offset(0, _isHovered ? 10 : 4),
              ),
            ],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

class GlowButton extends StatefulWidget {
  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool isOutlined;
  final Color? accentColor;
  final double horizontalPadding;
  final double verticalPadding;

  const GlowButton({
    super.key,
    required this.text,
    this.icon,
    this.onPressed,
    this.isOutlined = false,
    this.accentColor,
    this.horizontalPadding = 24,
    this.verticalPadding = 14,
  });

  @override
  State<GlowButton> createState() => _GlowButtonState();
}

class _GlowButtonState extends State<GlowButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final accent = widget.accentColor ?? PortfolioColors.primary;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          padding: EdgeInsets.symmetric(
            horizontal: widget.horizontalPadding,
            vertical: widget.verticalPadding,
          ),
          transform: Matrix4.translationValues(0.0, _isHovered ? -2.0 : 0.0, 0.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: widget.isOutlined
                ? null
                : LinearGradient(
                    colors: [
                      accent,
                      accent.withValues(alpha: 0.85),
                    ],
                  ),
            color: widget.isOutlined
                ? (_isHovered
                    ? accent.withValues(alpha: 0.12)
                    : Colors.transparent)
                : null,
            border: widget.isOutlined
                ? Border.all(
                    color: _isHovered ? accent : PortfolioColors.border,
                    width: 1.4,
                  )
                : null,
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: accent.withValues(alpha: 0.4),
                      blurRadius: 18,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null) ...[
                Icon(
                  widget.icon,
                  size: 16,
                  color: widget.isOutlined
                      ? (_isHovered ? accent : (widget.accentColor ?? PortfolioColors.pageTextPrimary))
                      : Colors.white,
                ),
                const SizedBox(width: 8),
              ],
              Text(
                widget.text,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: widget.isOutlined
                      ? (_isHovered ? accent : (widget.accentColor ?? PortfolioColors.pageTextPrimary))
                      : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TechChip extends StatelessWidget {
  final String label;
  final Color? color;
  final bool isSmall;

  const TechChip({
    super.key,
    required this.label,
    this.color,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    final chipColor = color ?? PortfolioColors.primary;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 10 : 12,
        vertical: isSmall ? 4 : 6,
      ),
      decoration: BoxDecoration(
        color: chipColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: chipColor.withValues(alpha: 0.25),
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: isSmall ? 11 : 12,
          fontWeight: FontWeight.w500,
          color: PortfolioColors.textPrimary,
        ),
      ),
    );
  }
}

class SocialIconButton extends StatefulWidget {
  final dynamic icon;
  final String tooltip;
  final VoidCallback onTap;
  final Color? accentColor;

  const SocialIconButton({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.onTap,
    this.accentColor,
  });

  @override
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool _isHovered = false;

  Widget _buildIcon(Color color) {
    if (widget.icon is FaIconData) {
      return FaIcon(
        widget.icon as FaIconData,
        size: 18,
        color: color,
      );
    } else if (widget.icon is IconData) {
      return Icon(
        widget.icon as IconData,
        size: 18,
        color: color,
      );
    } else if (widget.icon is Widget) {
      return widget.icon as Widget;
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final accent = widget.accentColor ?? PortfolioColors.primary;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Tooltip(
        message: widget.tooltip,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _isHovered
                  ? accent.withValues(alpha: 0.15)
                  : PortfolioColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _isHovered ? accent : PortfolioColors.border,
                width: 1.2,
              ),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: accent.withValues(alpha: 0.3),
                        blurRadius: 12,
                      ),
                    ]
                  : [],
            ),
            child: _buildIcon(_isHovered ? accent : PortfolioColors.textSecondary),
          ),
        ),
      ),
    );
  }
}
