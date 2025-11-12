import 'package:flutter/material.dart';

import '../utils/enums.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  // Breakpoint constants untuk konsistensi
  static const double mobileMaxWidth = 767;
  static const double tabletMaxWidth = 1024;
  static const double desktopMinWidth = 1025;

  // Method yang lebih robust dengan breakpoint yang konsisten
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= mobileMaxWidth;

  static bool isTablet(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return width > mobileMaxWidth && width <= tabletMaxWidth;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopMinWidth;

  // Method untuk mendapatkan tipe device saat ini
  static ScreenType getScreenType(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    if (width <= mobileMaxWidth) {
      return ScreenType.mobile;
    }
    if (width <= tabletMaxWidth) {
      return ScreenType.tablet;
    }
    return ScreenType.desktop;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    // Logika yang lebih jelas dan konsisten
    if (width >= desktopMinWidth) {
      return desktop;
    }
    // Jika tablet tersedia dan lebar layar dalam range tablet
    else if (width > mobileMaxWidth && tablet != null) {
      return tablet!;
    }
    // Fallback ke mobile
    else {
      return mobile;
    }
  }
}

// Extension untuk utility tambahan
extension ScreenTypeExtension on ScreenType {
  String get name {
    switch (this) {
      case ScreenType.mobile:
        return 'Mobile';
      case ScreenType.tablet:
        return 'Tablet';
      case ScreenType.desktop:
        return 'Desktop';
    }
  }
}
