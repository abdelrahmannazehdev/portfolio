import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import '../core/responsive.dart';
import 'section_wrapper.dart';

class AboutSection extends StatelessWidget {
  final GlobalKey sectionKey;
  const AboutSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return SectionWrapper(
      sectionKey: sectionKey,
      eyebrow: '01 · About',
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  right: isMobile ? 0 : 16, bottom: isMobile ? 16 : 0),
              child: Text(
                "I build production-grade cross-platform applications "
                "that solve real business problems. Over the past 4+ "
                "years, I've delivered enterprise collaboration suites, "
                "healthcare platforms, productivity tools, loyalty "
                "systems, and real-time communication apps — each "
                "architected for maintainability and scale from day one.",
                style: AppText.body(size: 16),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: isMobile ? 0 : 16),
              child: Text(
                "My approach combines Clean Architecture with modular "
                "Bloc/Cubit state management, ensuring every feature is "
                "isolated, testable, and easy to evolve. I prioritize "
                "code that teams can confidently extend — not just "
                "features that ship fast. Performance, accessibility, "
                "and user experience are built in, not bolted on.",
                style: AppText.body(size: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
