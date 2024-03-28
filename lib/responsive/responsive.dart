import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive(
      {super.key,
      required this.mobile,
      this.tablet,
      required this.desktop});
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 650 &&
      MediaQuery.of(context).size.width < 1100;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (size.width >= 1100) {
      return desktop;
    } else if (size.width >= 650 && size.width < 1100) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}