import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lipika/application/assets_path.dart';

import '../../../../application/routes/app_route_const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  initState(){
    super.initState();
    _goToNextScreen();
  }

  Future<void> _goToNextScreen()async{
      await Future.delayed(const Duration(seconds: 2));
      if(mounted) {
        GoRouter.of(context).pushReplacementNamed(AppRouteConst.homeRouteName);
      }
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
