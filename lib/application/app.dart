import 'package:flutter/material.dart';
import 'package:lipika/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:lipika/features/home/ui/screens/home_screen.dart';

import 'app_theme.dart';

class Lipika extends StatelessWidget {
  const Lipika({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
      home: MainBottomNavScreen(),
    );
  }
}
