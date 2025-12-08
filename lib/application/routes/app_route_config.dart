import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lipika/features/category/ui/screens/categories_screen.dart';
import 'package:lipika/features/checkout_funnel/ui/screens/checkout.dart';
import 'package:lipika/features/checkout_funnel/ui/screens/order_confirmation.dart';
import 'package:lipika/features/profile/ui/screens/account_settings.dart';
import 'package:lipika/features/profile/ui/screens/personal_details.dart';
import 'package:lipika/features/profile/ui/screens/privacy_policy.dart';
import 'package:lipika/features/profile/ui/screens/profile.dart';

import '../../features/checkout_funnel/ui/screens/cart.dart';
import '../../features/common/ui/screens/main_bottom_nav_screen.dart';
import '../../features/profile/ui/screens/return_policy.dart';
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
      GoRoute(
        name: AppRouteConst.profileDetailsRouteName,
        path: "/profileDetails",
        pageBuilder: (context, state)=> const MaterialPage(child: PersonalDetails()),
      ),
      GoRoute(
        name: AppRouteConst.accountSettingsRouteName,
        path: "/accountSettings",
        pageBuilder: (context, state)=> const MaterialPage(child: AccountSettings()),
      ),
      GoRoute(
        name: AppRouteConst.privacyPolicyRouteName,
        path: "/privacyPolicy",
        pageBuilder: (context, state)=> const MaterialPage(child: PrivacyPolicy()),
      ),
      GoRoute(
        name: AppRouteConst.returnPolicyRouteName,
        path: "/returnPolicy",
        pageBuilder: (context, state)=> const MaterialPage(child: ReturnPolicy()),
      ),
      GoRoute(
        name: AppRouteConst.categoriesRouteName,
        path: "/categories",
        pageBuilder: (context, state)=> const MaterialPage(child: CategoriesScreen()),
      ),
    ]
  );