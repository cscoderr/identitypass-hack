import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:identitypass_hack/app/app_route.dart';
import 'package:identitypass_hack/core/repository/api_repository.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.apiRepository}) : super(key: key);

  final ApiRepository apiRepository;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: apiRepository),
      ],
      child: const _App(),
    );
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
