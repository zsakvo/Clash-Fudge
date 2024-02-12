import 'package:clash_fudge/extension/int.dart';
import 'package:clash_fudge/extension/string.dart';
import 'package:flutter/material.dart';
import 'package:material_color_utilities/palettes/core_palette.dart';

String parseDynamicColor(String svgString, {required int primaryColor, bool isDarkTheme = false}) {
  final tonalPalettes = CorePalette.contentOf(primaryColor);
  return svgString.replaceAllMapped(
    RegExp(r'fill="(.+?)"'),
    (Match match) {
      String value = match.group(1)!;
      if (value.startsWith("#")) {
        return match.group(0)!;
      }

      try {
        List<String> splitValues = value.split(RegExp('(?<=\\d)(?=\\D)|(?=\\d)(?<=\\D)'));
        String scheme = splitValues[0];
        String tone = splitValues[1];
        int argb;

        switch (scheme) {
          case "p":
            argb = tonalPalettes.primary.get(int.parse(tone).autoToDarkTone(isDarkTheme));
            break;
          case "s":
            argb = tonalPalettes.secondary.get(int.parse(tone).autoToDarkTone(isDarkTheme));
            break;
          case "t":
            argb = tonalPalettes.tertiary.get(int.parse(tone).autoToDarkTone(isDarkTheme));
            break;
          case "n":
            argb = tonalPalettes.neutral.get(int.parse(tone).autoToDarkTone(isDarkTheme));
            break;
          case "nv":
            argb = tonalPalettes.neutralVariant.get(int.parse(tone).autoToDarkTone(isDarkTheme));
            break;
          case "e":
            argb = tonalPalettes.error.get(int.parse(tone).autoToDarkTone(isDarkTheme));
            break;
          default:
            argb = Colors.transparent.value;
        }
        return 'fill="${argb.toRadixString(16).hexToJsColor().toUpperCase()}"';
      } catch (e) {
        return match.group(0)!;
      }
    },
  );
}
