import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tot_app/features/discover_dogs/presentation/bloc/discover_dogs_bloc.dart';

class DiscoverDogsScreen extends StatefulWidget {
  const DiscoverDogsScreen({super.key, required this.title});

  final String title;

  static final String route = 'discover-dogs';

  @override
  State<DiscoverDogsScreen> createState() => _DiscoverDogsScreenState();
}

class _DiscoverDogsScreenState extends State<DiscoverDogsScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DiscoverDogsBloc>(context).add(InitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
