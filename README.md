## m3_color_scheme

Utilities for generating Material 3 `ColorScheme` and `ThemeData` from a seed color using the official `material_color_utilities` algorithms.

This package provides:

- **`M3ColorScheme` extension**: Converts a `DynamicScheme` (from `material_color_utilities`) into Flutter's `ColorScheme`.
- **`DynamicTheme` helper**: Builds light and dark `ThemeData` from a single seed color with optional Material 3 and typography configuration.

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  m3_color_scheme: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## Quick start

Create a dynamic Material 3 theme for your app from a seed color:

```dart
import 'package:flutter/material.dart';
import 'package:m3_color_scheme/m3_color_scheme.dart';

void main() {
  final dynamicTheme = DynamicTheme.fromColor(
    const Color(0xFF6750A4), // Your seed color
    useMaterial3: true,
    fontFamily: 'Inter', // optional
  );

  runApp(MaterialApp(
    theme: dynamicTheme.lightTheme,
    darkTheme: dynamicTheme.darkTheme,
    themeMode: ThemeMode.system,
    home: const MyHomePage(),
  ));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('M3 Dynamic Theme')),
      body: Center(
        child: FilledButton(
          onPressed: () {},
          child: const Text('Hello'),
        ),
      ),
    );
  }
}
```

## API

- **`extension M3ColorScheme on DynamicScheme`**

  - `ColorScheme toColorScheme()`
    - Maps all fields from a `DynamicScheme` (e.g., from `SchemeTonalSpot`) to Flutter's `ColorScheme`, including primary/secondary/tertiary, containers, error, outline, surface variants, inverse colors, shadow, scrim, and `brightness`.

- **`class DynamicTheme`**
  - `factory DynamicTheme.fromColor(Color seedColor, { bool? useMaterial3, String? fontFamily, PageTransitionsTheme? pageTransitionsTheme })`
    - Generates both light and dark `ThemeData` using the Tonal Spot scheme derived from the given `seedColor`.
    - Returns an instance with `lightTheme` and `darkTheme` properties.

## Using the extension directly

If you prefer to work with `material_color_utilities` yourself, you can build a scheme and convert it:

```dart
import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:m3_color_scheme/m3_color_scheme.dart';

final hct = Hct.fromInt(const Color(0xFF006876).value);
final dynamicScheme = SchemeTonalSpot(
  sourceColorHct: hct,
  isDark: false,
  contrastLevel: 0.0,
);
final colorScheme = dynamicScheme.toColorScheme();
final theme = ThemeData(colorScheme: colorScheme, useMaterial3: true);
```

## Notes

- Built on top of the official `material_color_utilities` package.
- Ensure you opt in to Material 3 (`useMaterial3: true`) if you want M3 components and defaults.
- `fontFamily` and `pageTransitionsTheme` are optional conveniences passed through to the produced `ThemeData`.

## Related links

- Material Color Utilities: [`https://github.com/material-foundation/material-color-utilities`](https://github.com/material-foundation/material-color-utilities)

## License

This project is licensed. See `LICENSE` for details.

## Changelog

See `CHANGELOG.md` for version history.
