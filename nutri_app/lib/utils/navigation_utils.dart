import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_app/screens/barcode_screen.dart';
import 'package:nutri_app/screens/get_info/get_info_screen.dart';
import 'package:nutri_app/screens/home_screen/home_screen.dart';
import 'package:nutri_app/screens/home_screen2.dart';
import 'package:nutri_app/screens/home_screen3.dart';
import 'package:nutri_app/screens/home_screen4.dart';
import 'package:nutri_app/screens/landing_screen.dart';
import 'package:nutri_app/screens/signin_options_screen.dart';
import 'package:nutri_app/screens/signin/signin_page.dart';
import 'package:nutri_app/utils/nested_navigation.dart';

class RouteNames {
  static const landingScreen = '/landing';
  static const signinOptionsScreen = '/signinOptions';
  static const signinScreen = '/signin';
  static const getInfoScreen = '/getInfo';
  static const scanScreen = '/scan';
  static const homeScreen = '/home';
  static const homeScreen2 = '/home2';
  static const homeScreen3 = '/home3';
  static const homeScreen4 = '/home4';
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'Home');
final _shellNavigatorHome2Key = GlobalKey<NavigatorState>(debugLabel: 'Home2');
final _shellNavigatorHome3Key = GlobalKey<NavigatorState>(debugLabel: 'Home3');
final _shellNavigatorHome4Key = GlobalKey<NavigatorState>(debugLabel: 'Home4');
final _shellNavigatorBarcodeKey =
    GlobalKey<NavigatorState>(debugLabel: 'Barcode');

final goRouter = GoRouter(
  initialLocation: RouteNames.landingScreen,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: RouteNames.landingScreen,
      builder: (context, state) => const LandingScreen(),
    ),
    GoRoute(
      path: RouteNames.signinOptionsScreen,
      builder: (context, state) => const SiginOptionsScreen(),
    ),
    GoRoute(
      path: RouteNames.signinScreen,
      builder: (context, state) => const SigninScreen(),
    ),
    GoRoute(
      path: RouteNames.getInfoScreen,
      builder: (context, state) => const GetInfoScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHomeKey,
          routes: [
            GoRoute(
              path: RouteNames.homeScreen,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomeScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHome2Key,
          routes: [
            GoRoute(
              path: RouteNames.homeScreen2,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomeScreen2(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBarcodeKey,
          routes: [
            GoRoute(
              path: RouteNames.scanScreen,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: BarcodeScreen()),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHome3Key,
          routes: [
            GoRoute(
              path: RouteNames.homeScreen,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomeScreen3(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHome4Key,
          routes: [
            GoRoute(
              path: RouteNames.homeScreen,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomeScreen4(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
