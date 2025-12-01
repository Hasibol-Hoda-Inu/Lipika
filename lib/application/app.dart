import 'package:flutter/material.dart';
import 'package:lipika/application/routes/app_route_config.dart';

import 'app_theme.dart';

class Lipika extends StatelessWidget {
  const Lipika({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      routeInformationParser: appRouter.routeInformationParser,
      routerDelegate: appRouter.routerDelegate,
      routeInformationProvider: appRouter.routeInformationProvider,

      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,

      // home: const MainBottomNavScreen(),
    );
  }
}
