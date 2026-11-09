import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod_template/portfolio/constants/portfolio_colors.dart';
import 'package:flutter_riverpod_template/portfolio/constants/portfolio_data.dart';
import 'package:flutter_riverpod_template/portfolio/widgets/common_widgets.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isSent = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      final name = _nameController.text.trim();
      final subject = _subjectController.text.trim().isNotEmpty
          ? _subjectController.text.trim()
          : "Portfolio Contact from $name";
      final message = _messageController.text.trim();
      final email = _emailController.text.trim();

      final fullBody = "Hi Remon,\n\n$message\n\nBest regards,\n$name\nEmail: $email";
      final mailtoUri = Uri(
        scheme: 'mailto',
        path: PortfolioData.email,
        queryParameters: {
          'subject': subject,
          'body': fullBody,
        },
      );

      UrlHelper.launchWebUrl(mailtoUri.toString());

      setState(() => _isSent = true);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: PortfolioColors.surfaceElevated,
          content: Text(
            "Thank you! Your email client has been launched.",
            style: GoogleFonts.poppins(color: PortfolioColors.accentGreen),
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _copyToClipboard(String text, String label) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: PortfolioColors.surfaceElevated,
        content: Text(
          "$label copied to clipboard!",
          style: GoogleFonts.poppins(color: PortfolioColors.primary),
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

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
                tag: "// 06. Get In Touch",
                title: "Let's Build Something Exceptional",
                subtitle:
                    "Open for architectural consultations, high-performance Flutter mobile development, and full-time engineering roles.",
              ),
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 5, child: _buildContactInfo(context)),
                    const SizedBox(width: 36),
                    Expanded(flex: 7, child: _buildContactForm(context)),
                  ],
                )
              else
                Column(
                  children: [
                    _buildContactInfo(context),
                    const SizedBox(height: 36),
                    _buildContactForm(context),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return HoverCard(
      padding: const EdgeInsets.all(32),
      borderColor: PortfolioColors.borderGlow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contact Details",
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: PortfolioColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Feel free to reach out directly via email, phone, or any of my social channels.",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: PortfolioColors.textSecondary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 28),
          _contactItem(
            icon: Icons.mail_outline_rounded,
            label: "Primary Email",
            value: PortfolioData.email,
            color: PortfolioColors.primary,
            onTap: () => UrlHelper.launchMail(PortfolioData.email),
            onCopy: () => _copyToClipboard(PortfolioData.email, "Primary Email"),
          ),
          const SizedBox(height: 18),
          _contactItem(
            icon: Icons.alternate_email_rounded,
            label: "Alternate Email",
            value: PortfolioData.secondaryEmail,
            color: PortfolioColors.primaryLight,
            onTap: () => UrlHelper.launchMail(PortfolioData.secondaryEmail),
            onCopy: () => _copyToClipboard(PortfolioData.secondaryEmail, "Alternate Email"),
          ),
          const SizedBox(height: 18),
          _contactItem(
            icon: FontAwesomeIcons.whatsapp,
            label: "Phone / WhatsApp",
            value: PortfolioData.phone,
            color: const Color(0xFF25D366),
            onTap: () => UrlHelper.launchWebUrl(PortfolioData.whatsappUrl),
            onCopy: () => _copyToClipboard(PortfolioData.phone, "Phone"),
          ),
          const SizedBox(height: 18),
          _contactItem(
            icon: Icons.place_outlined,
            label: "Location",
            value: PortfolioData.location,
            color: PortfolioColors.accentPink,
          ),
          const SizedBox(height: 28),
          const Divider(color: PortfolioColors.border),
          const SizedBox(height: 20),
          Text(
            "Connect Online",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: PortfolioColors.textPrimary,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              SocialIconButton(
                icon: FontAwesomeIcons.github,
                tooltip: "GitHub",
                onTap: () => UrlHelper.launchWebUrl(PortfolioData.githubUrl),
              ),
              const SizedBox(width: 12),
              SocialIconButton(
                icon: FontAwesomeIcons.linkedin,
                tooltip: "LinkedIn",
                onTap: () => UrlHelper.launchWebUrl(PortfolioData.linkedinUrl),
                accentColor: const Color(0xFF0A66C2),
              ),
              const SizedBox(width: 12),
              SocialIconButton(
                icon: Icons.facebook,
                tooltip: "Facebook",
                onTap: () => UrlHelper.launchWebUrl(PortfolioData.facebookUrl),
                accentColor: const Color(0xFF1877F2),
              ),
              const SizedBox(width: 12),
              SocialIconButton(
                icon: FontAwesomeIcons.whatsapp,
                tooltip: "WhatsApp",
                onTap: () => UrlHelper.launchWebUrl(PortfolioData.whatsappUrl),
                accentColor: const Color(0xFF25D366),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _contactItem({
    required dynamic icon,
    required String label,
    required String value,
    required Color color,
    VoidCallback? onTap,
    VoidCallback? onCopy,
  }) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: icon is IconData
              ? Icon(icon, color: color, size: 20)
              : FaIcon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: PortfolioColors.textMuted,
                  fontWeight: FontWeight.w500,
                ),
              ),
              InkWell(
                onTap: onTap,
                child: Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: PortfolioColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (onCopy != null)
          IconButton(
            tooltip: "Copy $label",
            icon: const Icon(Icons.copy_rounded, size: 16),
            color: PortfolioColors.textSecondary,
            onPressed: onCopy,
          ),
      ],
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return HoverCard(
      padding: const EdgeInsets.all(32),
      borderRadius: 20,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Send a Direct Message",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: PortfolioColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Fill out the form below to start a conversation.",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: PortfolioColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: _buildInputField(
                    controller: _nameController,
                    label: "Your Name",
                    hint: "e.g. Alex Smith",
                    icon: Icons.person_outline_rounded,
                    validator: (v) =>
                        v == null || v.isEmpty ? "Name is required" : null,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildInputField(
                    controller: _emailController,
                    label: "Your Email",
                    hint: "e.g. alex@example.com",
                    icon: Icons.mail_outline_rounded,
                    validator: (v) {
                      if (v == null || v.isEmpty) return "Email is required";
                      if (!v.contains('@') || !v.contains('.')) {
                        return "Invalid email";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            _buildInputField(
              controller: _subjectController,
              label: "Subject",
              hint: "e.g. Enterprise Flutter Project / Job Opportunity",
              icon: Icons.subject_rounded,
            ),
            const SizedBox(height: 18),
            _buildInputField(
              controller: _messageController,
              label: "Message",
              hint: "Write your message or inquiry here...",
              icon: Icons.chat_outlined,
              maxLines: 5,
              validator: (v) =>
                  v == null || v.isEmpty ? "Please enter a message" : null,
            ),
            const SizedBox(height: 28),
            GlowButton(
              text: _isSent ? "Message Ready / Sent" : "Send Message",
              icon: _isSent
                  ? Icons.check_circle_rounded
                  : Icons.send_rounded,
              onPressed: _handleSubmit,
              horizontalPadding: 32,
              verticalPadding: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: PortfolioColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          validator: validator,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: PortfolioColors.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(
              fontSize: 13,
              color: PortfolioColors.textMuted,
            ),
            filled: true,
            fillColor: PortfolioColors.backgroundSecondary,
            prefixIcon: maxLines == 1
                ? Icon(icon, size: 18, color: PortfolioColors.primary)
                : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: PortfolioColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: PortfolioColors.primary,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
