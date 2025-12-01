import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/checkout_funnel/ui/screens/cart.dart';
import '../../features/common/ui/screens/main_bottom_nav_screen.dart';
import 'app_route_const.dart';


final GoRouter appRouter = GoRouter(
  initialLocation: "/",
    routes: [
      GoRoute(
        name: AppRouteConst.homeRouteName,
        path: "/",
        pageBuilder: (context, state)=> const MaterialPage(child: MainBottomNavScreen()),
      ),
      GoRoute(
        name: AppRouteConst.cartRouteName,
        path: "/cart",
        pageBuilder: (context, state)=> const MaterialPage(child: Cart()),
      ),
    ]
  );