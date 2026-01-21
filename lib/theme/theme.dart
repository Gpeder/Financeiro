import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      surface: AppColors.card,
      onSurface: AppColors.onCard,
      error: AppColors.destructive,
      onError: AppColors.onPrimary,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      titleTextStyle: AppTextStyles.text18Bold,
      iconTheme: IconThemeData(color: AppColors.foreground),
    ),

    cardTheme: CardThemeData(
      color: AppColors.card,
      elevation: 2,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),

    textTheme: const TextTheme(
      bodyMedium: AppTextStyles.text14,
      bodyLarge: AppTextStyles.text16,
      titleMedium: AppTextStyles.text18,
      titleLarge: AppTextStyles.text20,
      headlineSmall: AppTextStyles.text24,
      headlineMedium: AppTextStyles.text30,
      headlineLarge: AppTextStyles.text32,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.input,
      hintStyle: const TextStyle(color: AppColors.onMuted),
      labelStyle: const TextStyle(color: AppColors.onMuted),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.ring),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.destructive),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppTextStyles.text16Bold,
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.onPrimary,
    ),

    dividerTheme: const DividerThemeData(color: AppColors.border, thickness: 1),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.background,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.onMuted,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
  );
}

class AppTextStyles {
  static const String _fontTitles = 'PlusJakartaSans';
  static const String _fontBody = 'Inter';
  static const Color _defaultColor = AppColors.foreground;

  static const TextStyle text14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: _fontBody,
    color: _defaultColor,
  );

  static const TextStyle text16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: _fontBody,
    color: _defaultColor,
  );
  static const TextStyle text16Bold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: _fontBody,
    color: _defaultColor,
  );

  static const TextStyle text18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: _fontBody,
    color: _defaultColor,
  );
  static const TextStyle text18Bold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: _fontBody,
    color: _defaultColor,
  );

  static const TextStyle text20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontFamily: _fontBody,
    color: _defaultColor,
  );
  static const TextStyle text20Bold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: _fontBody,
    color: _defaultColor,
  );

  static const TextStyle text24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    fontFamily: _fontTitles,
    color: _defaultColor,
  );
  static const TextStyle text24Bold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: _fontTitles,
    color: _defaultColor,
  );

  static const TextStyle text30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w400,
    fontFamily: _fontTitles,
    color: _defaultColor,
  );
  static const TextStyle text30Bold = TextStyle(
    fontFamily: _fontTitles,
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: _defaultColor,
  );

  static const TextStyle text32 = TextStyle(
    fontFamily: _fontTitles,
    fontSize: 32,
    fontWeight: FontWeight.w400,
    color: _defaultColor,
  );
  static const TextStyle text32Bold = TextStyle(
    fontFamily: _fontTitles,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: _defaultColor,
  );
}

// Cores
class AppColors {
  // Cores Principais
  static const Color primary = Color(0xFFA995C9);
  static const Color onPrimary = Color(0xFF1A1823);

  static const Color secondary = Color(0xFF5A5370);
  static const Color onSecondary = Color(0xFFE0DDEF);

  // Fundo e Texto Geral
  static const Color background = Color(0xFF1A1823);
  static const Color foreground = Color(0xFFE0DDEF);

  // Cards e Popups
  static const Color card = Color(0xFF232030);
  static const Color popover = Color(0xFF232030);
  static const Color onCard = Color(0xFFE0DDEF);

  // Estados e Bordas
  static const Color muted = Color(0xFF242031);
  static const Color onMuted = Color(0xFFA09AAD);
  static const Color destructive = Color(0xFFE57373);
  static const Color border = Color(0xFF302C40);
  static const Color input = Color(0xFF2A273A);
  static const Color ring = Color(0xFFA995C9);

  // Cores de Gráficos
  static const Color chart1 = Color(0xFFA995C9);
  static const Color chart2 = Color(0xFFF2B8C6);
  static const Color chart3 = Color(0xFF77B8A1);
  static const Color chart4 = Color(0xFFF0C88D);
  static const Color chart5 = Color(0xFFA0BBE3);
}
