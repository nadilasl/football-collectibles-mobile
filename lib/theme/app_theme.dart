import 'package:flutter/material.dart';

class FeedbackColors extends ThemeExtension<FeedbackColors> {
  final Color successBg;
  final Color successBorder;
  final Color successText;
  final Color errorBg;
  final Color errorBorder;
  final Color errorText;
  final Color neutralBg;
  final Color neutralBorder;
  final Color neutralText;

  const FeedbackColors({
    required this.successBg,
    required this.successBorder,
    required this.successText,
    required this.errorBg,
    required this.errorBorder,
    required this.errorText,
    required this.neutralBg,
    required this.neutralBorder,
    required this.neutralText,
  });

  @override
  ThemeExtension<FeedbackColors> copyWith({
    Color? successBg,
    Color? successBorder,
    Color? successText,
    Color? errorBg,
    Color? errorBorder,
    Color? errorText,
    Color? neutralBg,
    Color? neutralBorder,
    Color? neutralText,
  }) => FeedbackColors(
    successBg: successBg ?? this.successBg,
    successBorder: successBorder ?? this.successBorder,
    successText: successText ?? this.successText,
    errorBg: errorBg ?? this.errorBg,
    errorBorder: errorBorder ?? this.errorBorder,
    errorText: errorText ?? this.errorText,
    neutralBg: neutralBg ?? this.neutralBg,
    neutralBorder: neutralBorder ?? this.neutralBorder,
    neutralText: neutralText ?? this.neutralText,
  );

  @override
  ThemeExtension<FeedbackColors> lerp(
    ThemeExtension<FeedbackColors>? other,
    double t,
  ) {
    if (other is! FeedbackColors) return this;
    return FeedbackColors(
      successBg: Color.lerp(successBg, other.successBg, t)!,
      successBorder: Color.lerp(successBorder, other.successBorder, t)!,
      successText: Color.lerp(successText, other.successText, t)!,
      errorBg: Color.lerp(errorBg, other.errorBg, t)!,
      errorBorder: Color.lerp(errorBorder, other.errorBorder, t)!,
      errorText: Color.lerp(errorText, other.errorText, t)!,
      neutralBg: Color.lerp(neutralBg, other.neutralBg, t)!,
      neutralBorder: Color.lerp(neutralBorder, other.neutralBorder, t)!,
      neutralText: Color.lerp(neutralText, other.neutralText, t)!,
    );
  }
}

class AppTheme {
  // Base / brand colors
  static const Color brandPrimary = Color(0xFF7F4721); // button / accent
  static const Color brandBackground = Color(0xFFD5C1AC); // page background
  static const Color brandText = Color(0xFF33322B); // primary text
  static const Color brandSecondary = Color(0xFF7097A6); // secondary accents
  static const Color brandBorder = Color(0xFF95B0BF); // subtle borders

  // Status colors
  static const Color errorBg = Color(0xFFFEF2F2);
  static const Color errorBorder = Color(0xFFFECACA);
  static const Color errorText = Color(0xFFB91C1C);
  static const Color successBg = Color(0xFFF0FDF4);
  static const Color successBorder = Color(0xFFBBF7D0);
  static const Color successText = Color(0xFF15803D);
  static const Color neutralBg = Color(0xFFF9FAFB); // Gray-50 approximation
  static const Color neutralBorder = Color(0xFFE5E7EB); // Gray-200
  static const Color neutralText = Color(0xFF374151); // Gray-700

  static ThemeData get lightTheme {
    final colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: brandPrimary,
      onPrimary: Colors.white,
      secondary: brandSecondary,
      onSecondary: Colors.white,
      background: brandBackground,
      onBackground: brandText,
      surface: Colors.white,
      onSurface: brandText,
      error: errorText,
      onError: Colors.white,
      tertiary: brandBorder,
      onTertiary: brandText,
      // Fallbacks
      primaryContainer: brandSecondary.withOpacity(0.15),
      secondaryContainer: brandPrimary.withOpacity(0.15),
      surfaceContainerHighest: Colors.white,
      surfaceContainerLow: brandBackground,
      outline: brandBorder,
      shadow: Colors.black54,
      scrim: Colors.black54,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: brandBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        centerTitle: true,
        elevation: 0,
      ),
      cardTheme: const CardThemeData().copyWith(
        elevation: 2,
        color: colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: brandBorder.withOpacity(0.4)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: brandBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: brandBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: brandPrimary, width: 2),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: brandPrimary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      extensions: const [
        FeedbackColors(
          successBg: successBg,
          successBorder: successBorder,
          successText: successText,
          errorBg: errorBg,
          errorBorder: errorBorder,
          errorText: errorText,
          neutralBg: neutralBg,
          neutralBorder: neutralBorder,
          neutralText: neutralText,
        ),
      ],
    );
  }
}
