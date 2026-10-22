import 'package:flutter/material.dart';
import 'package:lipika/features/auth/ui/controllers/auth_controller.dart';
import 'package:lipika/features/common/ui/controller/main_bottom_nav_provider.dart';
import 'package:provider/provider.dart';

import '../features/auth/data/services/auth_service.dart';

class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>MainBottomNavProvider()),
        ChangeNotifierProvider(create: (context)=>AuthController(authService: AuthService())),
      ],
      child: child, 
    );
  }
}