import 'package:flutter/material.dart';
import '../core/app_theme.dart';

/// Faint fixed grid behind the whole page — matches the web version's
/// subtle texture. Kept quiet on purpose so it never competes with content.
class BackgroundGrid extends StatelessWidget {
  const BackgroundGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(
        painter: _GridPainter(),
        child: Container(color: AppColors.bgDeep),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.accentTealSoft.withValues(alpha: 0.035)
      ..strokeWidth = 1;
    const step = 42.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _GridPainter oldDelegate) => false;
}
