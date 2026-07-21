import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import 'section_wrapper.dart';

class SkillsSection extends StatelessWidget {
  final GlobalKey sectionKey;
  const SkillsSection({super.key, required this.sectionKey});

  static const _groups = [
    _SkillGroup('Mobile Development', [
      'Flutter', 'Dart', 'Android', 'iOS',
    ]),
    _SkillGroup('Architecture', [
      'Clean Architecture', 'BLoC', 'Cubit', 'SOLID', 'Design Patterns',
    ]),
    _SkillGroup('Backend & Services', [
      'Firebase', 'Supabase', 'REST APIs', 'Stripe', 'AWS S3',
      'WebSockets', 'WebRTC',
    ]),
    _SkillGroup('Tools & Platforms', [
      'Git', 'GitHub', 'GitHub Actions', 'CI/CD', 'Postman',
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      sectionKey: sectionKey,
      eyebrow: '04 · Core Competencies',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final columns = width > 900 ? 4 : (width > 600 ? 2 : 1);
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
                          g.category,
                          style: AppText.display(
                            size: 15,
                            weight: FontWeight.w600,
                            color: AppColors.accentTealSoft,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...g.skills.map(
                          (s) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 7, right: 10),
                                  child: Container(
                                    width: 5,
                                    height: 5,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.accentTeal,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    s,
                                    style: AppText.body(size: 14.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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

class _SkillGroup {
  final String category;
  final List<String> skills;
  const _SkillGroup(this.category, this.skills);
}
