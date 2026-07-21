import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/app_theme.dart';
import 'section_wrapper.dart';

class ContactSection extends StatelessWidget {
  final GlobalKey sectionKey;
  const ContactSection({super.key, required this.sectionKey});

  Future<void> _open(String url) async {
    await launchUrl(Uri.parse(url), webOnlyWindowName: '_blank');
  }

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      sectionKey: sectionKey,
      eyebrow: '05 · Contact',
      crossAxisAlignment: CrossAxisAlignment.center,
      child: Column(
        children: [
          Text(
            "Let's build something reliable.",
            textAlign: TextAlign.center,
            style: AppText.display(size: 32, weight: FontWeight.w600),
          ),
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Text(
              'Open to Senior Flutter Developer roles and mobile '
              'architecture work. Reach out directly — I usually '
              'reply within a day.',
              textAlign: TextAlign.center,
              style: AppText.body(size: 15),
            ),
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 14,
            runSpacing: 14,
            alignment: WrapAlignment.center,
            children: [
              _ContactPill(
                label: 'abdelrahmannazehdev@gmail.com',
                icon: Icons.email_outlined,
                onTap: () => _open('mailto:abdelrahmannazehdev@gmail.com'),
              ),
              _ContactPill(
                label: 'LinkedIn',
                icon: Icons.link,
                onTap: () => _open(
                    'https://linkedin.com/in/abdelrahman-nazeh-dev'),
              ),
              _ContactPill(
                label: 'GitHub',
                icon: Icons.code,
                onTap: () =>
                    _open('https://github.com/AbdelrahmanNazeh74'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContactPill extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  const _ContactPill({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_ContactPill> createState() => _ContactPillState();
}

class _ContactPillState extends State<_ContactPill> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Contact via ${widget.label}',
      button: true,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding:
                const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: _hover
                    ? AppColors.accentTeal
                    : AppColors.borderColor,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  widget.icon,
                  size: 16,
                  color: _hover
                      ? AppColors.accentTealSoft
                      : AppColors.textMuted,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.label,
                  style: AppText.body(
                    size: 14,
                    color: _hover
                        ? AppColors.accentTealSoft
                        : AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
