import 'package:flutter/material.dart';
import '../core/app_theme.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      child: Center(
        child: Text.rich(
          TextSpan(
            style: AppText.body(size: 13, color: AppColors.textFaint),
            children: const [
              TextSpan(text: '\u00a9 2026 Abdelrahman Nazeh'),
              TextSpan(text: '     '),
              TextSpan(
                text: 'Built with Flutter ',
              ),
              TextSpan(
                text: '\u2764',
                style: TextStyle(color: AppColors.accentTeal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
