import 'package:flutter/material.dart';

class AppColorScheme {
  final Color primary;
  final Color secondary;

  final Color backgroundColor;

  final Color cardColor;

  final Color primaryTextColor;
  final Color secondaryTextColor;

  AppColorScheme({
    required this.primary,
    required this.secondary,
    required this.backgroundColor,
    required this.cardColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
  });

  factory AppColorScheme.light() => AppColorScheme(
    primary: const Color(0xFF7047E8),
    secondary: const Color(0xFFE879C7),
    cardColor: const Color(0xFF292738),
    backgroundColor: const Color(0xFF09090D),
    primaryTextColor: const Color(0xFFFFFFFF),
    secondaryTextColor: const Color(0xFF9894A5),
  );

  factory AppColorScheme.of(BuildContext context) => AppColorScheme.light();
}
