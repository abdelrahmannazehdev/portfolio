import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import '../core/responsive.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key});

  static const _achievements = [
    ('4+', 'Years of\nFlutter Development'),
    ('5', 'Enterprise Applications\nDelivered'),
    ('25+', 'Production Screens\nBuilt'),
    ('Android\niOS', 'Production\nExperience'),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: isMobile ? 8 : 16,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: Responsive.maxContentWidth),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final columns = width > 700 ? 4 : (width > 400 ? 2 : 1);
              const gap = 16.0;
              final itemWidth =
                  (width - gap * (columns - 1)) / columns;
              return Wrap(
                spacing: gap,
                runSpacing: gap,
                children: _achievements
                    .map((a) => SizedBox(
                          width: itemWidth,
                          child: _AchievementCard(
                            value: a.$1,
                            label: a.$2,
                          ),
                        ))
                    .toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _AchievementCard extends StatelessWidget {
  final String value;
  final String label;
  const _AchievementCard({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '$value $label',
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.surface.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Column(
          children: [
            Text(
              value,
              textAlign: TextAlign.center,
              style: AppText.display(
                size: 28,
                weight: FontWeight.w700,
                color: AppColors.accentTeal,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: AppText.body(
                size: 13,
                color: AppColors.textMuted,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
