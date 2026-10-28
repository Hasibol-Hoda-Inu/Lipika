import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lipika/features/auth/ui/screens/email_confirmation_screen.dart';
import 'package:lipika/features/auth/ui/screens/login_screen.dart';
import 'package:lipika/features/auth/ui/screens/sign_up_screen.dart';
import 'package:lipika/features/auth/ui/screens/splash_screen.dart';
import 'package:lipika/features/category/ui/screens/categories_screen.dart';
import 'package:lipika/features/checkout_funnel/ui/screens/checkout.dart';
import 'package:lipika/features/checkout_funnel/ui/screens/order_confirmation.dart';
import 'package:lipika/features/my_books/ui/screen/upload_book_screen.dart';
import 'package:lipika/features/profile/ui/screens/account_settings.dart';
import 'package:lipika/features/profile/ui/screens/personal_details.dart';
import 'package:lipika/features/profile/ui/screens/privacy_policy.dart';
import 'package:lipika/features/profile/ui/screens/profile.dart';

import '../../features/auth/ui/controllers/auth_session_controller.dart';
import '../../features/checkout_funnel/ui/screens/cart.dart';
import '../../features/common/ui/screens/main_bottom_nav_screen.dart';
import '../../features/profile/ui/screens/return_policy.dart';
import 'app_route_const.dart';

GoRouter createAppRouter(AuthSessionController authSession) {
  return GoRouter(
    initialLocation: "/",
    refreshListenable: authSession,
    redirect: (BuildContext context, GoRouterState state) {
      final String? routeName = state.name;

      final String splashPath = state.namedLocation(
        AppRouteConst.splashRouteName,
      );
      final String loginPath = state.namedLocation(
        AppRouteConst.loginRouteName,
      );
      final String homePath = state.namedLocation(AppRouteConst.homeRouteName);
      final bool isSplash = routeName == AppRouteConst.splashRouteName;

      final bool isAuthRoute =
          routeName == AppRouteConst.loginRouteName ||
          routeName == AppRouteConst.signUpRouteName ||
          routeName == AppRouteConst.emailConfirmationRouteName;

      switch (authSession.status) {
        case AppAuthStatus.initializing:
          return isSplash ? null : splashPath;

        case AppAuthStatus.unauthenticated:
          if (isAuthRoute) {
            return null;
          }

          return loginPath;

        case AppAuthStatus.authenticated:
          if (isSplash || isAuthRoute) {
            return homePath;
          }

          return null;
      }
    },
    routes: [
      GoRoute(
        name: AppRouteConst.splashRouteName,
        path: "/",
        pageBuilder: (context, state) =>
            const MaterialPage(child: SplashScreen()),
      ),
      GoRoute(
        name: AppRouteConst.homeRouteName,
        path: "/home",
        pageBuilder: (context, state) =>
            const MaterialPage(child: MainBottomNavScreen()),
      ),
      GoRoute(
        name: AppRouteConst.signUpRouteName,
        path: "/signUp",
        pageBuilder: (context, state) =>
            const MaterialPage(child: SignUpScreen()),
      ),
      GoRoute(
        name: AppRouteConst.emailConfirmationRouteName,
        path: "/emailConfirmation",
        pageBuilder: (context, state) {
          final String email = state.extra as String? ?? "";
          return MaterialPage(child: EmailConfirmationScreen(email: email));
        },
      ),
      GoRoute(
        name: AppRouteConst.loginRouteName,
        path: "/login",
        pageBuilder: (context, state) =>
            const MaterialPage(child: LoginScreen()),
      ),
      GoRoute(
        name: AppRouteConst.profileRouteName,
        path: "/profile",
        pageBuilder: (context, state) => const MaterialPage(child: Profile()),
      ),
      GoRoute(
        name: AppRouteConst.cartRouteName,
        path: "/cart",
        pageBuilder: (context, state) => const MaterialPage(child: Cart()),
      ),
      GoRoute(
        name: AppRouteConst.checkoutRouteName,
        path: "/checkout",
        pageBuilder: (context, state) => const MaterialPage(child: Checkout()),
      ),
      GoRoute(
        name: AppRouteConst.orderConfirmRouteName,
        path: "/orderConfirm",
        pageBuilder: (context, state) =>
            const MaterialPage(child: OrderConfirmation()),
      ),
      GoRoute(
        name: AppRouteConst.profileDetailsRouteName,
        path: "/profileDetails",
        pageBuilder: (context, state) =>
            const MaterialPage(child: PersonalDetails()),
      ),
      GoRoute(
        name: AppRouteConst.accountSettingsRouteName,
        path: "/accountSettings",
        pageBuilder: (context, state) =>
            const MaterialPage(child: AccountSettings()),
      ),
      GoRoute(
        name: AppRouteConst.privacyPolicyRouteName,
        path: "/privacyPolicy",
        pageBuilder: (context, state) =>
            const MaterialPage(child: PrivacyPolicy()),
      ),
      GoRoute(
        name: AppRouteConst.returnPolicyRouteName,
        path: "/returnPolicy",
        pageBuilder: (context, state) =>
            const MaterialPage(child: ReturnPolicy()),
      ),
      GoRoute(
        name: AppRouteConst.categoriesRouteName,
        path: "/categories",
        pageBuilder: (context, state) =>
            const MaterialPage(child: CategoriesScreen()),
      ),
      GoRoute(
        name: AppRouteConst.uploadBookRouteName,
        path: "/uploadBook",
        pageBuilder: (context, state) =>
            const MaterialPage(child: UploadBookScreen()),
      ),
    ],
  );
}
