import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import 'about_section.dart';
import 'achievements_section.dart';
import 'background_grid.dart';
import 'contact_section.dart';
import 'experience_section.dart';
import 'footer_section.dart';
import 'hero_section.dart';
import 'nav_bar.dart';
import 'projects_section.dart';
import 'reveal_on_scroll.dart';
import 'skills_section.dart';

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollTo(String id) {
    final key = {
      'about': _aboutKey,
      'experience': _experienceKey,
      'projects': _projectsKey,
      'skills': _skillsKey,
      'contact': _contactKey,
    }[id];
    final ctx = key?.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDeep,
      body: Stack(
        children: [
          const Positioned.fill(child: BackgroundGrid()),
          Column(
            children: [
              NavBar(onNavTap: _scrollTo),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      HeroSection(
                        sectionKey: _heroKey,
                        onViewProjects: () => _scrollTo('projects'),
                      ),
                      const AchievementsSection(),
                      RevealOnScroll(
                        controller: _scrollController,
                        child: AboutSection(sectionKey: _aboutKey),
                      ),
                      RevealOnScroll(
                        controller: _scrollController,
                        child:
                            ExperienceSection(sectionKey: _experienceKey),
                      ),
                      RevealOnScroll(
                        controller: _scrollController,
                        child:
                            ProjectsSection(sectionKey: _projectsKey),
                      ),
                      RevealOnScroll(
                        controller: _scrollController,
                        child: SkillsSection(sectionKey: _skillsKey),
                      ),
                      RevealOnScroll(
                        controller: _scrollController,
                        child:
                            ContactSection(sectionKey: _contactKey),
                      ),
                      const FooterSection(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
