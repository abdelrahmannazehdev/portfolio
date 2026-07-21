import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import '../core/responsive.dart';
import '../core/utils.dart';
import 'animated_module_map.dart';

class HeroSection extends StatelessWidget {
  final GlobalKey sectionKey;
  final VoidCallback onViewProjects;
  const HeroSection({
    super.key,
    required this.sectionKey,
    required this.onViewProjects,
  });

  Future<void> _downloadResume() async {
    final uri = Uri.base.resolve('Abdelrahman_Nazeh_Resume.pdf');
    await openUrl(uri.toString());
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final showModuleMap =
        MediaQuery.of(context).size.width >= Responsive.maxContentWidth;

    final content = ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 580),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Semantics(
            label: 'Senior Flutter Developer',
            child: Text('SENIOR FLUTTER DEVELOPER',
                style: AppText.mono(letterSpacing: 3)),
          ),
          const SizedBox(height: 18),
          Semantics(
            header: true,
            child: Text.rich(
              TextSpan(
                style: AppText.display(size: isMobile ? 34 : 48),
                children: const [
                  TextSpan(
                      text: 'Building Enterprise-Grade\n'),
                  TextSpan(
                    text: 'Cross-Platform Apps',
                    style: TextStyle(color: AppColors.accentSky),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 22),
          Semantics(
            label:
                'Specializing in Flutter, Clean Architecture, and modern backend technologies',
            child: Text(
              'Specializing in Flutter, Clean Architecture, and modern '
              'backend technologies. I architect and ship production '
              'mobile applications used by thousands — with a focus on '
              'modular systems, real-time capabilities, and code quality '
              'that scales across teams and products.',
              style: AppText.body(size: 17),
            ),
          ),
          const SizedBox(height: 34),
          Wrap(
            spacing: 14,
            runSpacing: 14,
            children: [
              ElevatedButton(
                onPressed: _downloadResume,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accentTeal,
                  foregroundColor: AppColors.bgDeep,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 26, vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  textStyle: AppText.body(
                      size: 14.5,
                      weight: FontWeight.w600,
                      color: AppColors.bgDeep),
                ),
                child: Semantics(
                  label: 'Download Resume',
                  child: const Text('Download Resume'),
                ),
              ),
              OutlinedButton(
                onPressed: onViewProjects,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.borderColor),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 26, vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Text('View Projects',
                    style: AppText.body(
                        size: 14.5, color: AppColors.textPrimary)),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 16,
            runSpacing: 10,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              _SocialIcon(
                icon: Icons.code,
                label: 'GitHub',
                onTap: () =>
                    openUrl('https://github.com/AbdelrahmanNazeh74'),
              ),
              _SocialIcon(
                icon: Icons.link,
                label: 'LinkedIn',
                onTap: () => openUrl(
                    'https://linkedin.com/in/abdelrahman-nazeh-dev'),
              ),
              Container(
                width: 1,
                height: 16,
                color: AppColors.textFaint.withValues(alpha: 0.4),
              ),
              Text('Giza, Egypt',
                  style: AppText.mono(
                      size: 13.5, color: AppColors.textFaint)),
              Text('·',
                  style: AppText.mono(color: AppColors.textFaint)),
              Text('4+ years experience',
                  style: AppText.mono(
                      size: 13.5, color: AppColors.textFaint)),
              Text('·',
                  style: AppText.mono(color: AppColors.textFaint)),
              Text('Available',
                  style: AppText.mono(
                      size: 13.5,
                      color: AppColors.accentTealSoft)),
            ],
          ),
        ],
      ),
    );

    return Container(
      key: sectionKey,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: Responsive.maxContentWidth),
          child: SizedBox(
            height: showModuleMap ? 620 : null,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                if (showModuleMap)
                  const Positioned(
                    right: -40,
                    top: 0,
                    bottom: 0,
                    width: 700,
                    child: Opacity(
                        opacity: 0.9, child: AnimatedModuleMap()),
                  ),
                Align(
                  alignment: showModuleMap
                      ? Alignment.centerLeft
                      : Alignment.topLeft,
                  child: content,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _SocialIcon({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '${widget.label} profile',
      button: true,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _hover
                    ? AppColors.accentTeal.withValues(alpha: 0.6)
                    : AppColors.borderColor,
              ),
              color: _hover
                  ? AppColors.accentTeal.withValues(alpha: 0.08)
                  : Colors.transparent,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(widget.icon,
                    size: 16,
                    color: _hover
                        ? AppColors.accentTealSoft
                        : AppColors.textMuted),
                const SizedBox(width: 6),
                Text(
                  widget.label,
                  style: AppText.mono(
                    size: 13,
                    color: _hover
                        ? AppColors.accentTealSoft
                        : AppColors.textMuted,
                    letterSpacing: 0.5,
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
