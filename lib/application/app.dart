import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lipika/application/routes/app_route_config.dart';
import 'package:provider/provider.dart';

import '../features/auth/ui/controllers/auth_session_controller.dart';
import 'app_theme.dart';

class Lipika extends StatefulWidget {
  const Lipika({super.key});

  @override
  State<Lipika> createState() => _LipikaState();
}

class _LipikaState extends State<Lipika> {

  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    final AuthSessionController authSession =
    context.read<AuthSessionController>();
    _router = createAppRouter(authSession);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      routerConfig: _router,

      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
    );
  }

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }
}
