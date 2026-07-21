import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/app_theme.dart';
import '../core/responsive.dart';
import 'animated_module_map.dart';

class HeroSection extends StatelessWidget {
  final GlobalKey sectionKey;
  final VoidCallback onViewProjects;
  const HeroSection({
    super.key,
    required this.sectionKey,
    required this.onViewProjects,
  });

  Future<void> _downloadCv() async {
    // Looks for Abdelrahman_Nazeh_CV.pdf next to the deployed site.
    // Place the file in the /web folder so Flutter web copies it as-is.
    final uri = Uri.base.resolve('Abdelrahman_Nazeh_CV.pdf');
    await launchUrl(uri, webOnlyWindowName: '_blank');
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    // The module map is 700px wide and positioned to bleed off the right
    // edge, which only reads as a decorative overlap at full desktop width.
    // Below that it would sit on top of most of the text column, so it's
    // hidden for tablet/narrow-laptop widths too, not just mobile.
    final showModuleMap = MediaQuery.of(context).size.width >= Responsive.maxContentWidth;

    final content = ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 560),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('FLUTTER DEVELOPER', style: AppText.mono(letterSpacing: 3)),
          const SizedBox(height: 18),
          Text.rich(
            TextSpan(
              style: AppText.display(size: isMobile ? 34 : 52),
              children: [
                const TextSpan(text: 'Mobile Architecture &\n'),
                TextSpan(
                  text: 'Systems Design',
                  style: TextStyle(color: AppColors.accentSky),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Text(
            "I design and ship cross-platform mobile applications for "
            "Android & iOS — with a focus on modular architecture, "
            "real-time systems, and code that scales across teams, not "
            "just screens.",
            style: AppText.body(size: 17),
          ),
          const SizedBox(height: 34),
          Wrap(
            spacing: 14,
            runSpacing: 14,
            children: [
              ElevatedButton(
                onPressed: onViewProjects,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accentTeal,
                  foregroundColor: AppColors.bgDeep,
                  padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  textStyle: AppText.body(size: 14.5, weight: FontWeight.w600, color: AppColors.bgDeep),
                ),
                child: const Text('View Projects'),
              ),
              OutlinedButton(
                onPressed: _downloadCv,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.borderColor),
                  padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text('Download CV', style: AppText.body(size: 14.5, color: AppColors.textPrimary)),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 10,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text('Giza, Egypt', style: AppText.mono(size: 13.5, color: AppColors.textFaint)),
              Text('·', style: AppText.mono(color: AppColors.textFaint)),
              Text('3+ years experience', style: AppText.mono(size: 13.5, color: AppColors.textFaint)),
              Text('·', style: AppText.mono(color: AppColors.textFaint)),
              Text('Available for opportunities', style: AppText.mono(size: 13.5, color: AppColors.textFaint)),
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
          constraints: const BoxConstraints(maxWidth: Responsive.maxContentWidth),
          child: SizedBox(
            height: showModuleMap ? 620 : null,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                if (showModuleMap)
                  Positioned(
                    right: -40,
                    top: 0,
                    bottom: 0,
                    width: 700,
                    child: Opacity(opacity: 0.9, child: const AnimatedModuleMap()),
                  ),
                Align(
                  alignment: showModuleMap ? Alignment.centerLeft : Alignment.topLeft,
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
