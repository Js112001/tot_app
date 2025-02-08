part of 'bookmarks_bloc.dart';

sealed class BookmarksState extends Equatable {}

class InitialBookmarkState extends BookmarksState {
  @override
  List<Object?> get props => [];
}

class BookmarkLoadingState extends BookmarksState {
  @override
  List<Object?> get props => [];
}

class BookMarkedState extends BookmarksState {
  final String message;
  final bool isSuccess;
  final DogEntity dog;

  BookMarkedState({
    required this.message,
    required this.isSuccess,
    required this.dog,
  });

  @override
  List<Object?> get props => [dog, message, isSuccess];
}

class RemoveBookmarkState extends BookmarksState {
  final String message;
  final DogEntity dog;

  RemoveBookmarkState({
    required this.message,
    required this.dog,
  });

  @override
  List<Object?> get props => [dog, message];
}

class FetchBookmarksState extends BookmarksState {
  final List<DogEntity> dogs;

  FetchBookmarksState(this.dogs);

  @override
  List<Object?> get props => [dogs];
}
