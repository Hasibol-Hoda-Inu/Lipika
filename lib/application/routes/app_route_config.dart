import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lipika/features/checkout_funnel/ui/screens/checkout.dart';
import 'package:lipika/features/checkout_funnel/ui/screens/order_confirmation.dart';
import 'package:lipika/features/profile/ui/screens/profile.dart';

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
        name: AppRouteConst.profileRouteName,
        path: "/profile",
        pageBuilder: (context, state)=> const MaterialPage(child: Profile()),
      ),
      GoRoute(
        name: AppRouteConst.cartRouteName,
        path: "/cart",
        pageBuilder: (context, state)=> const MaterialPage(child: Cart()),
      ),
      GoRoute(
        name: AppRouteConst.checkoutRouteName,
        path: "/checkout",
        pageBuilder: (context, state)=> const MaterialPage(child: Checkout()),
      ),
      GoRoute(
        name: AppRouteConst.orderConfirmRouteName,
        path: "/orderConfirm",
        pageBuilder: (context, state)=> const MaterialPage(child: OrderConfirmation()),
      ),
    ]
  );