import 'package:flutter/material.dart';
import '../core/app_theme.dart';

/// The hero's signature visual: a central hub connecting to module nodes,
/// drawing itself in on load. This is a literal callback to the CV bullet
/// "architected 5 independent feature modules... over a single hub" —
/// same concept used in the LinkedIn banner, for visual consistency.
class AnimatedModuleMap extends StatefulWidget {
  const AnimatedModuleMap({super.key});

  @override
  State<AnimatedModuleMap> createState() => _AnimatedModuleMapState();
}

class _AnimatedModuleMapState extends State<AnimatedModuleMap>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return CustomPaint(
          painter: _ModuleMapPainter(progress: _controller.value),
          child: const SizedBox.expand(),
        );
      },
    );
  }
}

class _ModuleMapPainter extends CustomPainter {
  final double progress;
  _ModuleMapPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final hub = Offset(size.width * 0.46, size.height * 0.5);

    final nodes = <Offset>[
      Offset(size.width * 0.10, size.height * 0.30),
      Offset(size.width * 0.34, size.height * 0.06),
      Offset(size.width * 0.68, size.height * 0.16),
      Offset(size.width * 0.80, size.height * 0.50),
      Offset(size.width * 0.64, size.height * 0.82),
      Offset(size.width * 0.18, size.height * 0.74),
    ];

    final linePaint = Paint()
      ..color = AppColors.accentTeal.withValues(alpha: 0.5)
      ..strokeWidth = 1.6
      ..style = PaintingStyle.stroke;

    for (var i = 0; i < nodes.length; i++) {
      // Stagger each connection so they draw in one after another.
      final t = (progress * nodes.length - i).clamp(0.0, 1.0);
      if (t <= 0) continue;

      final node = nodes[i];
      final mid = Offset.lerp(hub, node, 0.5)!;
      final dx = node.dx - hub.dx;
      final dy = node.dy - hub.dy;
      final normal = Offset(-dy, dx) * 0.12;
      final control = mid + normal;

      final path = Path()
        ..moveTo(hub.dx, hub.dy)
        ..quadraticBezierTo(control.dx, control.dy, node.dx, node.dy);

      final metrics = path.computeMetrics().first;
      final extracted = metrics.extractPath(0, metrics.length * t);
      canvas.drawPath(extracted, linePaint);

      if (t > 0.85) {
        final nodeOpacity = ((t - 0.85) / 0.15).clamp(0.0, 1.0);
        _drawNode(canvas, node, nodeOpacity);
      }
    }

    // Hub drawn last so it always sits on top of the connecting lines.
    final hubFill = Paint()
      ..color = AppColors.bgMid
      ..style = PaintingStyle.fill;
    final hubBorder = Paint()
      ..color = AppColors.accentTealSoft
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(hub, 26, hubFill);
    canvas.drawCircle(hub, 26, hubBorder);
    canvas.drawCircle(hub, 10, Paint()..color = AppColors.accentTealSoft);
  }

  void _drawNode(Canvas canvas, Offset center, double opacity) {
    const w = 106.0;
    const h = 58.0;
    final rect = Rect.fromCenter(center: center, width: w, height: h);
    final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(10));
    final fill = Paint()..color = AppColors.surface.withValues(alpha: opacity);
    final border = Paint()
      ..color = AppColors.accentSky.withValues(alpha: opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6;
    canvas.drawRRect(rrect, fill);
    canvas.drawRRect(rrect, border);
  }

  @override
  bool shouldRepaint(covariant _ModuleMapPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
