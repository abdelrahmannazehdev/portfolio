import 'package:flutter/material.dart';
import 'project_card.dart';
import 'section_wrapper.dart';

class ProjectsSection extends StatelessWidget {
  final GlobalKey sectionKey;
  const ProjectsSection({super.key, required this.sectionKey});

  static const _projects = [
    ProjectData(
      title: 'We-Co Corporate Suite',
      projectType: 'Enterprise Productivity Platform',
      description:
          'Unified enterprise productivity suite — document editor, '
          'spreadsheet editor, slide builder, and cloud storage — '
          "delivered as WeCodeForYou.io's flagship internal product.",
      tags: ['Flutter', 'Bloc/Cubit', 'REST', 'GoRouter', 'CI/CD'],
      contributions: [
        'Architected 5 independent feature modules with shared service-delegation pattern',
        'Cut boilerplate by 35% across document, spreadsheet, and presentation editors',
        'Delivered full RTL/Arabic localization across 30+ screens',
      ],
      isPrivate: true,
    ),
    ProjectData(
      title: 'We-Co Collaboration Platform',
      projectType: 'Real-Time Communication Platform',
      description:
          'Real-time video/audio calling, persistent team chat, integrated '
          'email client, and a task planner — all in one cross-platform '
          'application with zero cross-module coupling.',
      tags: ['Flutter', 'Bloc', 'LiveKit / WebRTC', 'WebSocket'],
      contributions: [
        'Led delivery of WebRTC video calling and persistent WebSocket chat',
        'Integrated email client and task planner across 6 feature areas',
        'Achieved zero cross-module coupling through clean interface contracts',
      ],
      isPrivate: true,
    ),
    ProjectData(
      title: 'DocNMore — Healthcare Platform',
      projectType: 'Healthcare Booking System',
      description:
          'Cross-platform clinic and doctor discovery/booking app with '
          'real-time availability, Stripe payments, and a BackOffice '
          'admin panel for managing providers and appointments.',
      tags: ['Flutter', 'GetX', 'Supabase', 'Stripe', 'flutter_map'],
      contributions: [
        'Built real-time availability system with Supabase real-time subscriptions',
        'Integrated Stripe payment processing across mobile and web',
        'Delivered dual-platform (mobile + web) with shared codebase',
      ],
      isPrivate: true,
    ),
    ProjectData(
      title: 'D-Squares — Loyalty & Rewards App',
      projectType: 'Loyalty & Engagement Platform',
      description:
          'White-label loyalty platform with multi-method authentication, '
          'personalized brand and offer discovery, and FCM-driven '
          'retention campaigns for end-users and business partners.',
      tags: ['Flutter', 'Bloc', 'Firebase', 'Dio'],
      contributions: [
        'Implemented multi-method authentication (email, phone, social)',
        'Built personalized offer discovery with real-time FCM campaigns',
        'Maintained 80%+ test coverage across all feature modules',
      ],
      isPrivate: true,
    ),
    ProjectData(
      title: 'Darabny — Sports Coaching Platform',
      projectType: 'Multi-Role Sports Ecosystem',
      description:
          'Multi-role sports coaching ecosystem supporting coaches, '
          'players, parents, and children — with role-based dashboards, '
          'session scheduling, and a full coach/nutritionist booking system.',
      tags: ['Flutter', 'Bloc', 'Firebase', 'Dio'],
      contributions: [
        'Designed multi-role architecture with 4 distinct user personas',
        'Built role-based dashboards with granular permission control',
        'Integrated coach/nutritionist booking with calendar management',
      ],
      isPrivate: true,
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
          final columns = width > 800 ? 2 : 1;
          const gap = 24.0;
          final itemWidth = (width - gap * (columns - 1)) / columns;
          return Wrap(
            spacing: gap,
            runSpacing: gap,
            children: _projects
                .map((p) => SizedBox(
                    width: itemWidth, child: ProjectCard(data: p)))
                .toList(),
          );
        },
      ),
    );
  }
}
