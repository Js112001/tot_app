import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tot_app/features/discover_dogs/domain/entity/dog_entity.dart';
import 'package:tot_app/features/discover_dogs/presentation/bloc/bookmarks/bookmarks_bloc.dart';
import 'package:tot_app/features/discover_dogs/presentation/bloc/discover_dogs/discover_dogs_bloc.dart';
import 'package:tot_app/features/discover_dogs/presentation/widgets/dog_info_card.dart';

class DiscoverDogsListing extends StatefulWidget {
  const DiscoverDogsListing({super.key});

  @override
  State<DiscoverDogsListing> createState() => _DiscoverDogsListingState();
}

class _DiscoverDogsListingState extends State<DiscoverDogsListing> {
  late ScrollController _scrollController;
  Timer? _debounce;
  int limit = 10;
  List<DogEntity> dogs = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DiscoverDogsBloc>(context).add(GetDogsEvent(limit: limit));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverDogsBloc, DiscoverDogsState>(
      builder: (context, state) {
        if (state is GetDogsDataSuccessState) {
          _scrollController = ScrollController();
          _scrollController.addListener(_scrollListener);
          if (limit > 10) {
            dogs += state.dogs;
          } else {
            dogs = state.dogs;
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.totalDocs,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    return BlocBuilder<BookmarksBloc, BookmarksState>(
                      builder: (context, bookmarkBlocState) {
                        if (bookmarkBlocState is BookMarkedState &&
                            bookmarkBlocState.isSuccess &&
                            bookmarkBlocState.dog.id == dogs[index].id) {
                          dogs = dogs.map((item) {
                            if (item.id == dogs[index].id) {
                              return item.copyWith(isBookmarked: true);
                            } else {
                              return item;
                            }
                          }).toList();
                          return DogInfoCard(
                            dogEntity: bookmarkBlocState.dog,
                            onBookmarkClick: () {
                              BlocProvider.of<BookmarksBloc>(context).add(
                                RemoveDogInfoBookmarkEvent(
                                  dogs[index],
                                ),
                              );
                            },
                          );
                        } else if (bookmarkBlocState is RemoveBookmarkState &&
                            bookmarkBlocState.dog.id == dogs[index].id) {
                          dogs = dogs.map((item) {
                            if (item.id == dogs[index].id) {
                              return item.copyWith(isBookmarked: false);
                            } else {
                              return item;
                            }
                          }).toList();
                          return DogInfoCard(
                            dogEntity: bookmarkBlocState.dog,
                            onBookmarkClick: () {
                              BlocProvider.of<BookmarksBloc>(context).add(
                                BookMarkDogInfoEvent(
                                  dogs[index],
                                ),
                              );
                            },
                          );
                        }
                        return DogInfoCard(
                          dogEntity: dogs[index],
                          onBookmarkClick: () {
                            if (dogs[index].isBookmarked) {
                              BlocProvider.of<BookmarksBloc>(context).add(
                                RemoveDogInfoBookmarkEvent(
                                  dogs[index],
                                ),
                              );
                            } else {
                              BlocProvider.of<BookmarksBloc>(context).add(
                                BookMarkDogInfoEvent(
                                  dogs[index],
                                ),
                              );
                            }
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              if (state.isPaginated)
                Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          );
        } else if (state is DiscoverDogsErrorState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 20,
                ),
                Text(
                  state.message,
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CircularProgressIndicator()],
            ),
          );
        }
      },
    );
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (_debounce?.isActive ?? false) {
        _debounce?.cancel();
      } else {
        limit += 10;
        _debounce = Timer(
          Duration(milliseconds: 500),
          () => BlocProvider.of<DiscoverDogsBloc>(context).add(
            GetDogsEvent(limit: limit),
          ),
        );
      }
    }
  }
}
