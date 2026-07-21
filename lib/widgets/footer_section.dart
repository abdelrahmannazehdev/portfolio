import 'package:flutter/material.dart';
import '../core/app_theme.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      child: Center(
        child: Text(
          '© $year Abdelrahman Nazeh. Built with Flutter developers in mind.',
          style: AppText.body(size: 13, color: AppColors.textFaint),
        ),
      ),
    );
  }
}
