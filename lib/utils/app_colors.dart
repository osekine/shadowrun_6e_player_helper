import 'dart:ui';

abstract class ColorHSL {
  static Color fromHSL(int h, int s, int l) {
    final hue = h / 360;
    final saturation = s / 100;
    final light = l / 100;

    if (saturation == 0) {
      final value = (light * 255).toInt();
      return Color.fromRGBO(value, value, value, 1.0);
    }

    final q = light < 0.5
        ? light * (1 + saturation)
        : light + saturation - light * saturation;
    final p = 2 * light - q;

    final r = (_hueToRgb(p, q, hue + 1 / 3) * 255).toInt();
    final g = (_hueToRgb(p, q, hue) * 255).toInt();
    final b = (_hueToRgb(p, q, hue - 1 / 3) * 255).toInt();

    return Color.fromRGBO(r, g, b, 1.0);
  }

  static double _hueToRgb(double p, double q, double t) {
    if (t < 0) t += 1;
    if (t > 1) t -= 1;

    if (t > 1) t -= 1;
    if (t < 1 / 6) return p + (q - p) * 6 * t;
    if (t < 1 / 2) return q;
    if (t < 2 / 3) return p + (q - p) * (2 / 3 - t) * 6;

    return p;
  }
}

class AppColors {
  static Color white = ColorHSL.fromHSL(235, 100, 100);
  static Color white2 = ColorHSL.fromHSL(235, 100, 98);
  static Color white5 = ColorHSL.fromHSL(235, 90, 96);
  static Color white10 = ColorHSL.fromHSL(235, 90, 90);
  static Color white20 = ColorHSL.fromHSL(237, 80, 79);

  static Color black = ColorHSL.fromHSL(250, 100, 5);
  static Color black10 = ColorHSL.fromHSL(248, 86, 9);
  static Color black15 = ColorHSL.fromHSL(245, 80, 13);
  static Color black20 = ColorHSL.fromHSL(245, 60, 20);

  static Color cyan = ColorHSL.fromHSL(217, 94, 69);
  static Color cyan65 = ColorHSL.fromHSL(217, 62, 44);

  static Color blue = ColorHSL.fromHSL(238, 100, 84);
  static Color blue30 = ColorHSL.fromHSL(239, 89, 77);
  static Color blue45 = ColorHSL.fromHSL(240, 55, 64);
  static Color blue50 = ColorHSL.fromHSL(242, 40, 52);
  static Color blue60 = ColorHSL.fromHSL(245, 47, 40);
  static Color blue70 = ColorHSL.fromHSL(251, 69, 27);
  static Color blue90 = ColorHSL.fromHSL(263, 100, 10);

  static Color orange = ColorHSL.fromHSL(53, 70, 46);
  static Color orange70 = ColorHSL.fromHSL(54, 100, 31);
  static Color orange85 = ColorHSL.fromHSL(52, 100, 14);
  static Color orange90 = ColorHSL.fromHSL(51, 100, 9);

  static Color red = ColorHSL.fromHSL(8, 79, 66);
  static Color red60 = ColorHSL.fromHSL(6, 60, 41);

  static Color green = ColorHSL.fromHSL(161, 100, 13);
  static Color green55 = ColorHSL.fromHSL(156, 68, 43);
}
