import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tot_app/core/di/injection_container.dart';
import 'package:tot_app/core/routes/app_navigator.dart';
import 'package:tot_app/features/discover_dogs/presentation/bloc/discover_dogs_bloc.dart';

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
        return MultiBlocProvider(
          providers: [
            BlocProvider<DiscoverDogsBloc>(
              create: (context) => sl(),
            )
          ],
          child: child!,
        );
      },
    );
  }
}
