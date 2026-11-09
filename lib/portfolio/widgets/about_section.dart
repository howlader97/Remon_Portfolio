import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod_template/portfolio/constants/portfolio_colors.dart';
import 'package:flutter_riverpod_template/portfolio/constants/portfolio_data.dart';
import 'package:flutter_riverpod_template/portfolio/widgets/common_widgets.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
                tag: "// 01. About Me",
                title: "Engineering Scalable, Production-Grade Systems",
                subtitle:
                    "Leveraging Flutter's native compilation and clean architectural patterns to engineer resilient, high-performance cross-platform applications across iOS and Android.",
              ),
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 5, child: _buildBioCard(context)),
                    const SizedBox(width: 32),
                    Expanded(flex: 7, child: _buildPillarsGrid(context, 2)),
                  ],
                )
              else
                Column(
                  children: [
                    _buildBioCard(context),
                    const SizedBox(height: 32),
                    _buildPillarsGrid(context, 1),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBioCard(BuildContext context) {
    return HoverCard(
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: PortfolioColors.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.person_rounded,
                  color: PortfolioColors.primary,
                  size: 26,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      PortfolioData.name,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: PortfolioColors.textPrimary,
                      ),
                    ),
                    Text(
                      "Senior Mobile Engineer",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: PortfolioColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            PortfolioData.professionalSummary,
            style: GoogleFonts.poppins(
              fontSize: 14,
              height: 1.75,
              color: PortfolioColors.textSecondary,
            ),
          ),
          const SizedBox(height: 24),
          const Divider(color: PortfolioColors.border),
          const SizedBox(height: 20),
          _infoRow(Icons.location_on_outlined, "Location", PortfolioData.location),
          const SizedBox(height: 12),
          _infoRow(Icons.email_outlined, "Email", PortfolioData.email),
          const SizedBox(height: 12),
          _infoRow(Icons.alternate_email_rounded, "Alt Email", PortfolioData.secondaryEmail),
          const SizedBox(height: 12),
          _infoRow(Icons.phone_outlined, "Phone", PortfolioData.phone),
          const SizedBox(height: 12),
          _infoRow(Icons.school_outlined, "Education", "B.Sc. in CSE (City University)"),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 16, color: PortfolioColors.primary),
        const SizedBox(width: 12),
        Text(
          "$label: ",
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: PortfolioColors.textPrimary,
          ),
        ),
        Expanded(
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: PortfolioColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPillarsGrid(BuildContext context, int crossAxisCount) {
    final pillars = [
      {
        "icon": Icons.layers_rounded,
        "title": "Clean Architecture & Modular MVVM",
        "desc":
            "Strict separation of Domain, Data, and Presentation layers. Decoupled logic using Riverpod & Bloc for modular testability and scalability.",
        "color": const Color(0xFF00D2FF),
      },
      {
        "icon": Icons.speed_rounded,
        "title": "60 FPS & Zero Memory Leaks",
        "desc":
            "Deep profiling with Flutter DevTools and Xcode Instruments. Precise widget rebuild optimization and aggressive asset precaching.",
        "color": const Color(0xFF10B981),
      },
      {
        "icon": Icons.podcasts_rounded,
        "title": "Real-Time Streaming & WebRTC",
        "desc":
            "Engineered ultra-low latency streaming modules utilizing LiveKit, WebSockets, and WebRTC with fault-tolerant reconnect mechanisms.",
        "color": const Color(0xFF6366F1),
      },
      {
        "icon": Icons.credit_card_rounded,
        "title": "FinTech & In-App Subscriptions",
        "desc":
            "End-to-end integration of Apple StoreKit In-App Purchases, RevenueCat paywalls, Stripe, and SSLCommerz multi-channel payment gateways.",
        "color": const Color(0xFFF59E0B),
      },
    ];

    if (crossAxisCount == 1) {
      return Column(
        children: pillars
            .map((p) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _buildPillarCard(p),
                ))
            .toList(),
      );
    }

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        childAspectRatio: 1.45,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: pillars.length,
      itemBuilder: (context, index) {
        return _buildPillarCard(pillars[index]);
      },
    );
  }

  Widget _buildPillarCard(Map<String, dynamic> pillar) {
    final Color color = pillar["color"] as Color;
    return HoverCard(
      borderColor: color.withValues(alpha: 0.25),
      glowColor: color,
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(pillar["icon"] as IconData, color: color, size: 22),
          ),
          const SizedBox(height: 14),
          Text(
            pillar["title"] as String,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: PortfolioColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            pillar["desc"] as String,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: PortfolioColors.textSecondary,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }
}
