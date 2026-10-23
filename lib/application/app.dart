import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lipika/application/routes/app_route_config.dart';
import 'package:lipika/application/routes/app_route_const.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app_theme.dart';

class Lipika extends StatefulWidget {
  const Lipika({super.key});

  @override
  State<Lipika> createState() => _LipikaState();
}

class _LipikaState extends State<Lipika> {
  late final StreamSubscription<AuthState> _authSubscription;

  @override
  void initState() {
    super.initState();
    _listenToAuthChanges();
  }

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

  void _listenToAuthChanges() {
    _authSubscription = Supabase.instance.client.auth.onAuthStateChange.listen(
      (AuthState data) {
        final AuthChangeEvent event = data.event;
        final Session? session = data.session;

        if (event == AuthChangeEvent.signedIn && session != null) {
          debugPrint("✅ User authenticated successfully");
          appRouter.pushReplacementNamed(AppRouteConst.homeRouteName);
        }else if(event == AuthChangeEvent.signedOut){
          debugPrint("❎ User signed out");
          appRouter.pushReplacementNamed(AppRouteConst.loginRouteName);
        }
      },
      onError: (Object error) {
        debugPrint("❎ Auth listener error: $error");
      },
    );
  }

  @override
  void dispose() {
    _authSubscription.cancel();
    super.dispose();
  }
}
