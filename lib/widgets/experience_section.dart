import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import '../core/responsive.dart';
import 'section_wrapper.dart';

class ExperienceSection extends StatelessWidget {
  final GlobalKey sectionKey;
  const ExperienceSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      sectionKey: sectionKey,
      eyebrow: '02 · Experience',
      child: Column(
        children: [
          _ExperienceItem(
            title: 'Flutter Developer',
            date: 'Dec 2023 — Present',
            org: 'WeCodeForYou.io · Hybrid, Cairo',
            points: const [
              'Architected 5 independent feature modules (document editor, spreadsheet editor, presentation builder, cloud storage) using Bloc/Cubit with a shared service-delegation pattern over a single Dio instance — cutting boilerplate by 35%.',
              'Led delivery of a real-time collaboration platform: WebRTC video calling, persistent WebSocket chat, integrated email client, and task planner across 6 independently developed feature areas with zero cross-module coupling.',
              'Delivered full RTL/Arabic localization (354 translation keys) across 30+ screens; configured GitHub Actions CI/CD for automatic release builds.',
              'Authored 50+ unit and integration tests (80% coverage), reducing QA-reported bugs by 40%.',
            ],
            isLast: false,
          ),
          _ExperienceItem(
            title: 'Intern — Flutter Developer',
            date: 'Feb 2022 — Feb 2023',
            org: 'Orange Digital Centre · Cairo',
            points: const [
              'Built 2+ production-style mobile applications applying Flutter, UI/UX, and mobile architecture fundamentals.',
              'Participated in 10+ code reviews and received direct mentorship from senior engineers.',
            ],
            isLast: true,
          ),
        ],
      ),
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final String title;
  final String date;
  final String org;
  final List<String> points;
  final bool isLast;

  const _ExperienceItem({
    required this.title,
    required this.date,
    required this.org,
    required this.points,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Stack(
      children: [
        if (!isLast)
          const Positioned(
            left: 15,
            top: 16,
            bottom: 0,
            child: SizedBox(
              width: 1,
              child: ColoredBox(color: AppColors.borderColor),
            ),
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 32,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.bgMid,
                    border: Border.all(color: AppColors.accentTealSoft, width: 2),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flex(
                      direction: isMobile ? Axis.vertical : Axis.horizontal,
                      crossAxisAlignment:
                          isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(title, style: AppText.display(size: 20, weight: FontWeight.w600)),
                        Text(date, style: AppText.mono(size: 13, color: AppColors.textFaint)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(org, style: AppText.body(size: 14.5, color: AppColors.accentSky)),
                    const SizedBox(height: 14),
                    ...points.map(
                      (p) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8, right: 12),
                              child: Container(
                                width: 5,
                                height: 5,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.accentTeal,
                                ),
                              ),
                            ),
                            Expanded(child: Text(p, style: AppText.body(size: 15))),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
