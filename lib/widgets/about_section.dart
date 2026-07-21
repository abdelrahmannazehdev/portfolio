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
              padding: EdgeInsets.only(right: isMobile ? 0 : 16, bottom: isMobile ? 16 : 0),
              child: Text(
                "I'm a Flutter Developer with 3+ years of experience "
                "architecting and shipping cross-platform mobile "
                "applications. My focus goes beyond writing screens — I "
                "design the underlying architecture that lets teams build "
                "faster: modular Bloc/Cubit systems, shared "
                "service-delegation patterns, and clean API contracts that "
                "scale across multiple apps at once.",
                style: AppText.body(size: 16),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: isMobile ? 0 : 16),
              child: Text(
                "I care about code that's still easy to work with a year "
                "later — not just code that works today. Along the way "
                "I've integrated Firebase, Supabase, Stripe, and real-time "
                "systems like WebRTC and WebSockets, delivered full "
                "RTL/Arabic localization, and maintained 80%+ test "
                "coverage across production apps.",
                style: AppText.body(size: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
