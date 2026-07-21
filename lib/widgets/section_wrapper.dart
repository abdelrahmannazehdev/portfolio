import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import '../core/responsive.dart';

/// Shared padding, max-width, and eyebrow label for every content section.
class SectionWrapper extends StatelessWidget {
  final GlobalKey? sectionKey;
  final String eyebrow;
  final Widget child;
  final CrossAxisAlignment crossAxisAlignment;

  const SectionWrapper({
    super.key,
    this.sectionKey,
    required this.eyebrow,
    required this.child,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: sectionKey,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 70),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: Responsive.maxContentWidth),
          child: Column(
            crossAxisAlignment: crossAxisAlignment,
            children: [
              Align(
                alignment: crossAxisAlignment == CrossAxisAlignment.center
                    ? Alignment.center
                    : Alignment.centerLeft,
                child: Text(eyebrow, style: AppText.mono(letterSpacing: 2)),
              ),
              const SizedBox(height: 26),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
