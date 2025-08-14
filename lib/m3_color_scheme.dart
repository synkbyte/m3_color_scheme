import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

extension M3ColorScheme on DynamicScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      primary: Color(primary),
      onPrimary: Color(onPrimary),
      primaryContainer: Color(primaryContainer),
      onPrimaryContainer: Color(onPrimaryContainer),
      secondary: Color(secondary),
      onSecondary: Color(onSecondary),
      secondaryContainer: Color(secondaryContainer),
      onSecondaryContainer: Color(onSecondaryContainer),
      tertiary: Color(tertiary),
      onTertiary: Color(onTertiary),
      tertiaryContainer: Color(tertiaryContainer),
      onTertiaryContainer: Color(onTertiaryContainer),
      error: Color(error),
      onError: Color(onError),
      errorContainer: Color(errorContainer),
      onErrorContainer: Color(onErrorContainer),
      outline: Color(outline),
      outlineVariant: Color(outlineVariant),
      surface: Color(surface),
      onSurface: Color(onSurface),
      onSurfaceVariant: Color(onSurfaceVariant),
      inverseSurface: Color(inverseSurface),
      onInverseSurface: Color(inverseOnSurface),
      inversePrimary: Color(inversePrimary),
      shadow: Color(shadow),
      scrim: Color(scrim),
      brightness: isDark ? Brightness.dark : Brightness.light,
    );
  }
}

class DynamicTheme {
  final ThemeData lightTheme;
  final ThemeData darkTheme;

  DynamicTheme._(this.lightTheme, this.darkTheme);

  factory DynamicTheme.fromColor(
    Color seedColor, {
    bool? useMaterial3,
    String? fontFamily,
    PageTransitionsTheme? pageTransitionsTheme,
  }) {
    final hctColor = Hct.fromInt(seedColor.toARGB32());

    final lightScheme = SchemeTonalSpot(
      sourceColorHct: hctColor,
      isDark: false,
      contrastLevel: 0.0,
    ).toColorScheme();

    final darkScheme = SchemeTonalSpot(
      sourceColorHct: hctColor,
      isDark: true,
      contrastLevel: 0.0,
    ).toColorScheme();

    return DynamicTheme._(
      ThemeData(
        colorScheme: lightScheme,
        useMaterial3: useMaterial3,
        fontFamily: fontFamily,
        pageTransitionsTheme: pageTransitionsTheme,
      ),
      ThemeData(
        colorScheme: darkScheme,
        useMaterial3: useMaterial3,
        fontFamily: fontFamily,
        pageTransitionsTheme: pageTransitionsTheme,
      ),
    );
  }
}
