import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tot_app/features/discover_dogs/presentation/screens/discover_dogs_screen.dart';

class AppNavigator {
  GoRouter setupRouter() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/${HomeScreen.route}',
          pageBuilder: (context, state) {
            final child = HomeScreen(title: 'Flutter Demo Home Page');
            if (Platform.isAndroid) {
              return MaterialPage(child: child);
            } else {
              return CupertinoPage(child: child);
            }
          },
        ),
      ],
      initialLocation: '/${HomeScreen.route}',
      debugLogDiagnostics: true,
    );
  }

  static void pop(BuildContext context) {
    GoRouter.of(context).pop();
  }

  static void pushPath(
    BuildContext context,
    String path, {
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic>? extra,
  }) {
    GoRouter.of(context).push(
      '/$path',
      extra: extra,
    );
  }

  static void pushPathReplacement(
    BuildContext context,
    String path, {
    Object? extra,
  }) {
    GoRouter.of(context).pushReplacement(
      '/$path',
      extra: extra,
    );
  }
}
