part of 'discover_dogs_bloc.dart';

sealed class DiscoverDogsState extends Equatable {}

class DiscoverDogsLoadingState extends DiscoverDogsState {
  @override
  List<Object?> get props => [];
}

class GetDogsDataSuccessState extends DiscoverDogsState {
  final List<DogEntity> dogs;
  final int totalDocs;
  final bool isPaginated;

  GetDogsDataSuccessState({
    required this.dogs,
    required this.totalDocs,
    required this.isPaginated,
  });

  @override
  List<Object?> get props => [dogs, totalDocs];
}

class DiscoverDogsErrorState extends DiscoverDogsState {
  final String message;

  DiscoverDogsErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
