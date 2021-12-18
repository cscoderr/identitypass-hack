import 'package:flutter/material.dart';
import 'package:identitypass_hack/app/app.dart';
import 'package:identitypass_hack/core/repository/api_repository.dart';

void main() {
  runApp(
    App(
      apiRepository: ApiRepository(),
    ),
  );
}
