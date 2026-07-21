import 'package:flutter/material.dart';
import 'project_card.dart';
import 'section_wrapper.dart';

class ProjectsSection extends StatelessWidget {
  final GlobalKey sectionKey;
  const ProjectsSection({super.key, required this.sectionKey});

  // Replace `imageAsset: null` with a real path once you have screenshots,
  // e.g. imageAsset: 'assets/images/weco_suite_1.png'
  static const _projects = [
    ProjectData(
      title: 'We-Co Corporate Suite',
      description:
          "Unified enterprise productivity suite — document editor, "
          "spreadsheet editor, slide builder, and cloud storage — "
          "delivered as WeCodeForYou.io's flagship internal product.",
      tags: ['Flutter', 'Bloc/Cubit', 'REST', 'GoRouter', 'CI/CD'],
      imageAsset: null,
    ),
    ProjectData(
      title: 'We-Co Collaboration Platform',
      description:
          'Real-time video/audio calling, persistent team chat, integrated '
          'email client, and a task planner in one cross-platform app.',
      tags: ['Flutter', 'Bloc', 'LiveKit / WebRTC', 'WebSocket'],
      imageAsset: null,
    ),
    ProjectData(
      title: 'DocNMore — Healthcare Platform',
      description:
          'Cross-platform (mobile + web) clinic and doctor discovery/booking '
          'app with real-time availability, Stripe payments, and a '
          'BackOffice admin panel.',
      tags: ['Flutter', 'GetX', 'Supabase', 'Stripe', 'flutter_map'],
      imageAsset: null,
    ),
    ProjectData(
      title: 'D-Squares — Loyalty & Rewards App',
      description:
          'Loyalty platform with multi-method authentication, personalized '
          'brand/offer discovery, and FCM-driven retention campaigns.',
      tags: ['Flutter', 'Bloc', 'Firebase', 'Dio'],
      imageAsset: null,
    ),
    ProjectData(
      title: 'Darabny — Sports Coaching Platform',
      description:
          'Multi-role ecosystem (coach/player/parent/child) with '
          'role-based dashboards and a full coach/nutritionist booking '
          'system.',
      tags: ['Flutter', 'Bloc', 'Firebase', 'Dio'],
      imageAsset: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      sectionKey: sectionKey,
      eyebrow: '03 · Selected Projects',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final columns = width > 900 ? 3 : (width > 600 ? 2 : 1);
          const gap = 20.0;
          final itemWidth = (width - gap * (columns - 1)) / columns;
          return Wrap(
            spacing: gap,
            runSpacing: gap,
            children: _projects
                .map((p) => SizedBox(width: itemWidth, child: ProjectCard(data: p)))
                .toList(),
          );
        },
      ),
    );
  }
}
