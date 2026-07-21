import 'package:flutter/material.dart';
import '../core/app_theme.dart';

class ProjectData {
  final String title;
  final String description;
  final List<String> tags;

  /// Leave null to show a placeholder. Once you have real screenshots:
  /// 1. Drop the image file into assets/images/
  /// 2. Set imageAsset: 'assets/images/your_file.png' below
  final String? imageAsset;

  const ProjectData({
    required this.title,
    required this.description,
    required this.tags,
    this.imageAsset,
  });
}

class ProjectCard extends StatefulWidget {
  final ProjectData data;
  const ProjectCard({super.key, required this.data});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _hover ? -4 : 0, 0),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: _hover ? AppColors.accentTeal : AppColors.borderColor,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _ImagePlaceholder(imageAsset: widget.data.imageAsset),
            const SizedBox(height: 16),
            Text(widget.data.title, style: AppText.display(size: 17, weight: FontWeight.w600)),
            const SizedBox(height: 8),
            Text(widget.data.description, style: AppText.body(size: 14.5)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.data.tags
                  .map(
                    (t) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.accentSky.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: AppColors.accentSky.withOpacity(0.2)),
                      ),
                      child: Text(
                        t,
                        style: AppText.mono(size: 11.5, color: AppColors.accentSky, letterSpacing: 0),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  final String? imageAsset;
  const _ImagePlaceholder({this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AspectRatio(
        aspectRatio: 16 / 10,
        child: imageAsset != null
            ? Image.asset(
                imageAsset!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const _PlaceholderBox(),
              )
            : const _PlaceholderBox(),
      ),
    );
  }
}

class _PlaceholderBox extends StatelessWidget {
  const _PlaceholderBox();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.bgMid,
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.image_outlined, color: AppColors.textFaint, size: 28),
            const SizedBox(height: 8),
            Text('Add screenshot', style: AppText.mono(size: 11, color: AppColors.textFaint, letterSpacing: 1)),
          ],
        ),
      ),
    );
  }
}
