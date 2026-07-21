import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/app_theme.dart';

class ProjectData {
  final String title;
  final String projectType;
  final String description;
  final List<String> tags;
  final List<String> contributions;
  final bool isPrivate;
  final String? liveUrl;
  final String? imageAsset;

  const ProjectData({
    required this.title,
    required this.projectType,
    required this.description,
    required this.tags,
    this.contributions = const [],
    this.isPrivate = true,
    this.liveUrl,
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

  Future<void> _openUrl(String url) async {
    await launchUrl(Uri.parse(url), webOnlyWindowName: '_blank');
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.data;
    return Semantics(
      label: 'Project: ${d.title}',
      child: MouseRegion(
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
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _ProjectImage(imageAsset: d.imageAsset),
              const SizedBox(height: 20),
              if (d.isPrivate)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: AppColors.accentTeal.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                        color: AppColors.accentTeal.withValues(alpha: 0.3)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.lock_outline,
                          size: 12, color: AppColors.accentTeal),
                      const SizedBox(width: 6),
                      Text(
                        'Private Enterprise Project',
                        style: AppText.mono(
                          size: 11,
                          color: AppColors.accentTeal,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              Text(
                d.projectType,
                style: AppText.mono(
                  size: 11.5,
                  color: AppColors.accentSky,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                d.title,
                style: AppText.display(size: 18, weight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Text(
                d.description,
                style: AppText.body(size: 14.5),
              ),
              if (d.contributions.isNotEmpty) ...[
                const SizedBox(height: 14),
                ...d.contributions.map(
                  (c) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8, right: 10),
                          child: Container(
                            width: 4,
                            height: 4,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.accentTeal,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            c,
                            style: AppText.body(size: 13.5, height: 1.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: d.tags
                    .map(
                      (t) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.accentSky.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                              color: AppColors.accentSky.withValues(alpha: 0.2)),
                        ),
                        child: Text(
                          t,
                          style: AppText.mono(
                            size: 11.5,
                            color: AppColors.accentSky,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              if (d.liveUrl != null) ...[
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () => _openUrl(d.liveUrl!),
                    icon: const Icon(Icons.open_in_new, size: 14),
                    label: const Text('Live Demo'),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.accentTeal),
                      foregroundColor: AppColors.accentTeal,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectImage extends StatelessWidget {
  final String? imageAsset;
  const _ProjectImage({this.imageAsset});

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
                errorBuilder: (context, error, stackTrace) =>
                    const _PlaceholderBox(),
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
            Icon(Icons.code, color: AppColors.accentTeal.withValues(alpha: 0.3),
                size: 32),
            const SizedBox(height: 8),
            Text(
              'Screenshot',
              style: AppText.mono(
                size: 11,
                color: AppColors.textFaint,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
