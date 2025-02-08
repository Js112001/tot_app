import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tot_app/features/discover_dogs/domain/entity/dog_entity.dart';
import 'package:tot_app/features/discover_dogs/presentation/bloc/bookmarks/bookmarks_bloc.dart';
import 'package:tot_app/features/discover_dogs/presentation/widgets/dog_info_card.dart';

class BookmarkedDogsScreen extends StatefulWidget {
  const BookmarkedDogsScreen({super.key});

  @override
  State<BookmarkedDogsScreen> createState() => _BookmarkedDogsScreenState();
}

class _BookmarkedDogsScreenState extends State<BookmarkedDogsScreen> {
  List<DogEntity> dogs = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<BookmarksBloc>(context).add(GetBookMarkedDogsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarksBloc, BookmarksState>(
      builder: (context, state) {
        if (state is FetchBookmarksState) {
          dogs = state.dogs;
        } else if (state is RemoveBookmarkState) {
          dogs.remove(state.dog);
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CircularProgressIndicator()],
            ),
          );
        }
        if (dogs.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.bookmark_add,
                  color: Colors.black,
                  size: 50,
                ),
                Text(
                  'Bookmark dogs info to see them offline.',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )
              ],
            ),
          );
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: dogs.length,
                itemBuilder: (context, index) {
                  return DogInfoCard(
                    dogEntity: dogs[index],
                    onBookmarkClick: () {
                      BlocProvider.of<BookmarksBloc>(context).add(
                        RemoveDogInfoBookmarkEvent(
                          dogs[index],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
