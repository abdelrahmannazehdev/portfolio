import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import '../core/responsive.dart';

class NavBar extends StatelessWidget {
  final void Function(String sectionId) onNavTap;
  const NavBar({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgDeep.withOpacity(0.82),
        border: const Border(bottom: BorderSide(color: AppColors.borderColor)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: Responsive.maxContentWidth),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: AppText.display(size: 20, weight: FontWeight.w700),
                    children: [
                      const TextSpan(text: 'AN'),
                      TextSpan(
                        text: '.',
                        style: TextStyle(color: AppColors.accentTeal),
                      ),
                    ],
                  ),
                ),
                if (!isMobile)
                  Row(
                    children: [
                      _NavLink(label: 'About', onTap: () => onNavTap('about')),
                      _NavLink(label: 'Experience', onTap: () => onNavTap('experience')),
                      _NavLink(label: 'Projects', onTap: () => onNavTap('projects')),
                      _NavLink(label: 'Skills', onTap: () => onNavTap('skills')),
                      const SizedBox(width: 8),
                      _NavCta(onTap: () => onNavTap('contact')),
                    ],
                  )
                else
                  _NavCta(onTap: () => onNavTap('contact')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _NavLink({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: onTap,
        child: Text(label, style: AppText.body(size: 14.5, color: AppColors.textMuted)),
      ),
    );
  }
}

class _NavCta extends StatelessWidget {
  final VoidCallback onTap;
  const _NavCta({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.borderColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      ),
      child: Text('Contact', style: AppText.body(size: 14, color: AppColors.textPrimary)),
    );
  }
}
