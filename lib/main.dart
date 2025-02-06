import 'package:flutter/material.dart';
import 'package:tot_app/app.dart';
import 'package:tot_app/core/di/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const App());
}
