import 'package:flutter/material.dart';
import 'core/app_theme.dart';
import 'widgets/portfolio_home.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Abdelrahman Nazeh — Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      home: const PortfolioHome(),
    );
  }
}
