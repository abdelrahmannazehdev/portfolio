import 'package:flutter/material.dart';

class RevealOnScroll extends StatefulWidget {
  final Widget child;
  final ScrollController controller;

  const RevealOnScroll({
    super.key,
    required this.child,
    required this.controller,
  });

  @override
  State<RevealOnScroll> createState() => _RevealOnScrollState();
}

class _RevealOnScrollState extends State<RevealOnScroll> {
  bool _visible = false;
  final GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_check);
    WidgetsBinding.instance.addPostFrameCallback((_) => _check());
  }

  void _check() {
    if (_visible || !mounted) return;
    final ctx = _key.currentContext;
    if (ctx == null) return;
    final box = ctx.findRenderObject() as RenderBox?;
    if (box == null || !box.attached) return;
    final position = box.localToGlobal(Offset.zero);
    final screenHeight = MediaQuery.of(context).size.height;
    if (position.dy < screenHeight * 0.88) {
      _visible = true;
      if (mounted) setState(() {});
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_check);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: _key,
      child: AnimatedOpacity(
        opacity: _visible ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
        child: AnimatedSlide(
          offset: _visible ? Offset.zero : const Offset(0, 0.04),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
          child: widget.child,
        ),
      ),
    );
  }
}
