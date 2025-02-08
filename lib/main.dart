import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tot_app/app.dart';
import 'package:tot_app/core/di/injection_container.dart';
import 'package:tot_app/features/discover_dogs/domain/entity/dog_entity.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DogEntityAdapter());
  await initializeDependencies();
  runApp(const App());
}
