import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:identitypass_hack/core/ui/ui.dart';
import 'package:identitypass_hack/features/authentication/login/view/login_page.dart';
import 'package:identitypass_hack/features/authentication/register/view/register_page.dart';
import 'package:identitypass_hack/features/home/home.dart';

class Pages {
  static const String landing = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgot = '/forgot';
  static const String home = '/home';
}

class AppRouter {
  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        path: Pages.landing,
        pageBuilder: (context, state) {
          return MaterialPage<void>(
            key: state.pageKey,
            child: const LoginPage(),
          );
        },
      ),
      GoRoute(
        path: Pages.register,
        pageBuilder: (context, state) {
          return MaterialPage<void>(
            key: state.pageKey,
            child: const RegisterPage(),
          );
        },
      ),
      GoRoute(
        path: Pages.home,
        pageBuilder: (context, state) {
          return MaterialPage<void>(
            key: state.pageKey,
            child: const HomePage(),
          );
        },
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text(
            'Oops you lost your way',
            style: CsTextStyle.headline3,
          ),
        ),
      ),
    ),
  );
}
