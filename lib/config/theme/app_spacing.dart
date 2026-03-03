import 'package:flutter/material.dart';

class AppSpacing {
  // Spacing scale
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;

  // Alias para mayor claridad
  static const double extraSmall = xs;
  static const double small = sm;
  static const double medium = md;
  static const double large = lg;
  static const double extraLarge = xl;
  static const double xxLarge = xxl;

  // Border radius
  static const double radiusXs = 4.0;
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 20.0;
  static const double radiusXl = 24.0;
  static const double radiusFull = 9999.0;

  // Common radius
  static const Radius radiusSmallTopLeft = Radius.circular(radiusSm);
  static const Radius radiusSmallTopRight = Radius.circular(radiusSm);
  static const Radius radiusSmallBottomLeft = Radius.circular(radiusSm);
  static const Radius radiusSmallBottomRight = Radius.circular(radiusSm);

  static BorderRadius borderRadiusSmall = BorderRadius.circular(radiusSm);
  static BorderRadius borderRadiusMedium = BorderRadius.circular(radiusMd);
  static BorderRadius borderRadiusLarge = BorderRadius.circular(radiusLg);

  // Shadows
  static const BoxShadow shadowSmall = BoxShadow(
    color: Color(0x1A000000),
    blurRadius: 2,
    offset: Offset(0, 1),
  );

  static const BoxShadow shadowMedium = BoxShadow(
    color: Color(0x19000000),
    blurRadius: 4,
    offset: Offset(0, 2),
  );

  static const BoxShadow shadowLarge = BoxShadow(
    color: Color(0x15000000),
    blurRadius: 12,
    offset: Offset(0, 4),
  );

  static const List<BoxShadow> shadowsSmall = [shadowSmall];
  static const List<BoxShadow> shadowsMedium = [shadowMedium];
  static const List<BoxShadow> shadowsLarge = [shadowLarge];

  // Edge insets (common padding combinations)
  static const EdgeInsets paddingXs = EdgeInsets.all(xs);
  static const EdgeInsets paddingSm = EdgeInsets.all(sm);
  static const EdgeInsets paddingMd = EdgeInsets.all(md);
  static const EdgeInsets paddingLg = EdgeInsets.all(lg);
  static const EdgeInsets paddingXl = EdgeInsets.all(xl);

  // Horizontal padding
  static const EdgeInsets paddingHorizontalSm =
      EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets paddingHorizontalMd =
      EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets paddingHorizontalLg =
      EdgeInsets.symmetric(horizontal: lg);

  // Vertical padding
  static const EdgeInsets paddingVerticalSm =
      EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets paddingVerticalMd =
      EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets paddingVerticalLg =
      EdgeInsets.symmetric(vertical: lg);

  // Common spacing values
  static const SizedBox spacingXs = SizedBox(height: xs);
  static const SizedBox spacingSm = SizedBox(height: sm);
  static const SizedBox spacingMd = SizedBox(height: md);
  static const SizedBox spacingLg = SizedBox(height: lg);
  static const SizedBox spacingXl = SizedBox(height: xl);

  // Horizontal spacing
  static const SizedBox spacingHorizontalXs = SizedBox(width: xs);
  static const SizedBox spacingHorizontalSm = SizedBox(width: sm);
  static const SizedBox spacingHorizontalMd = SizedBox(width: md);
  static const SizedBox spacingHorizontalLg = SizedBox(width: lg);
  static const SizedBox spacingHorizontalXl = SizedBox(width: xl);
}
