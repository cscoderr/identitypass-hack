import 'package:flutter/material.dart';
import 'package:identitypass_hack/app/app_route.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _App();
  }
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: AppRouter.routes.routeInformationParser,
      routerDelegate: AppRouter.routes.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }
}
