import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tot_app/features/discover_dogs/presentation/bloc/bookmarks/bookmarks_bloc.dart';
import 'package:tot_app/features/discover_dogs/presentation/screens/bookmarked_dogs_screen.dart';
import 'package:tot_app/features/discover_dogs/presentation/screens/discover_dogs_listing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  static final String route = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        surfaceTintColor: Platform.isIOS ? Colors.transparent : null,
        shadowColor: Platform.isIOS ? CupertinoColors.darkBackgroundGray : null,
        scrolledUnderElevation: Platform.isIOS ? .1 : null,
        toolbarHeight: Platform.isIOS ? 44 : null,
        title: Text(widget.title),
        actions: currentPageIndex == 1
            ? [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<BookmarksBloc>(context)
                        .add(ClearBookmarksEvent());
                  },
                  tooltip: 'Delete all bookmarks',
                  icon: Icon(
                    Icons.delete_outline,
                    color: Colors.black,
                    size: 30,
                  ),
                )
              ]
            : [],
      ),
      body: BlocListener<BookmarksBloc, BookmarksState>(
        listener: (context, state) {
          if (state is BookMarkedState) {
            final snackBarText = state.message;
            final snackBarColor = state.isSuccess ? Colors.green : Colors.red;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  snackBarText,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                backgroundColor: snackBarColor,
              ),
            );
          } else if (state is RemoveBookmarkState) {
            final snackBarText = state.message;
            final snackBarColor = Colors.green;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  snackBarText,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                backgroundColor: snackBarColor,
              ),
            );
          }
        },
        child: <Widget>[
          DiscoverDogsListing(),
          BookmarkedDogsScreen(),
        ][currentPageIndex],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'Bookmarks',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.messenger_sharp),
            ),
            label: 'Messages',
          ),
        ],
      ),
    );
  }
}
