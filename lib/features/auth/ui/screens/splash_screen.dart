import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lipika/application/assets_path.dart';
import 'package:provider/provider.dart';

import '../../../../application/routes/app_route_const.dart';
import '../controllers/auth_session_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      context.read<AuthSessionController>().startSplashTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AssetsPath.logo),
      ),
    );
  }
}
