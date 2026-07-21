import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Central color palette — matches the web portfolio and LinkedIn banner
/// so everything shares one visual identity.
class AppColors {
  static const bgDeep = Color(0xFF081C30);
  static const bgMid = Color(0xFF0B2C4A);
  static const surface = Color(0xFF0E3B5E);
  static const surfaceHover = Color(0xFF12496F);
  static const accentTeal = Color(0xFF3FC7B0);
  static const accentTealSoft = Color(0xFF8FE3D0);
  static const accentSky = Color(0xFF4FC3E8);
  static const textPrimary = Color(0xFFF0F6FA);
  static const textMuted = Color(0xFF9FB8CC);
  static const textFaint = Color(0xFF6E8AA3);
  static const borderColor = Color(0x2E8FE3D0);
}

/// Text style helpers. Space Grotesk = headings, Inter = body, JetBrains Mono = labels/eyebrows.
class AppText {
  static TextStyle display({
    double size = 32,
    FontWeight weight = FontWeight.w700,
    Color color = AppColors.textPrimary,
  }) {
    return GoogleFonts.spaceGrotesk(
      fontSize: size,
      fontWeight: weight,
      color: color,
      letterSpacing: -0.5,
      height: 1.1,
    );
  }

  static TextStyle body({
    double size = 15,
    FontWeight weight = FontWeight.w400,
    Color color = AppColors.textMuted,
    double height = 1.6,
  }) {
    return GoogleFonts.inter(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
    );
  }

  static TextStyle mono({
    double size = 13,
    Color color = AppColors.accentTeal,
    double letterSpacing = 2,
  }) {
    return GoogleFonts.jetBrainsMono(
      fontSize: size,
      color: color,
      letterSpacing: letterSpacing,
    );
  }
}

class AppTheme {
  static ThemeData get themeData {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.bgDeep,
      useMaterial3: true,
      fontFamily: GoogleFonts.inter().fontFamily,
      splashFactory: NoSplash.splashFactory,
    );
  }
}
