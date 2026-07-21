import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import 'section_wrapper.dart';

class SkillsSection extends StatelessWidget {
  final GlobalKey sectionKey;
  const SkillsSection({super.key, required this.sectionKey});

  static const _groups = [
    [
      'Languages & Platforms',
      'Dart, Flutter, native Android & iOS deployment, cross-platform development'
    ],
    [
      'Mobile Architecture',
      'Modular Bloc/Cubit design, feature-module isolation, service delegation patterns, clean architecture'
    ],
    ['State Management', 'Bloc, Cubit, Provider, GetX'],
    [
      'Real-Time Systems',
      'WebRTC (LiveKit), WebSocket messaging, Firebase Firestore sync, Supabase real-time'
    ],
    [
      'Backend & Integration',
      'REST APIs (Dio), Firebase, Supabase (PostgreSQL/BaaS), Stripe, Google Maps, presigned S3 uploads'
    ],
    [
      'Quality & Delivery',
      'Unit/integration testing (80%+ coverage), GitHub Actions CI/CD, Git, Agile/Scrum'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      sectionKey: sectionKey,
      eyebrow: '04 · Core Competencies',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final columns = width > 900 ? 3 : (width > 600 ? 2 : 1);
          const gap = 24.0;
          final itemWidth = (width - gap * (columns - 1)) / columns;
          return Wrap(
            spacing: gap,
            runSpacing: gap,
            children: _groups
                .map(
                  (g) => SizedBox(
                    width: itemWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          g[0],
                          style: AppText.display(
                            size: 15,
                            weight: FontWeight.w600,
                            color: AppColors.accentTealSoft,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(g[1], style: AppText.body(size: 14.5)),
                      ],
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
