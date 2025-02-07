import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tot_app/features/discover_dogs/presentation/bloc/discover_dogs_bloc.dart';
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
  var dogs = [];

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
          dogs += state.dogs;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.totalDocs,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    return DogInfoCard(dogEntity: dogs[index]);
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
