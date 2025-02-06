import 'package:flutter/material.dart';
import 'package:tot_app/core/routes/app_navigator.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppNavigator().setupRouter();
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
      builder: (context, child) {
        return child!;
      },
    );
  }
}
