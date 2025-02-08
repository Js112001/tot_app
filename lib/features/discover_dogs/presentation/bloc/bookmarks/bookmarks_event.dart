part of 'bookmarks_bloc.dart';

sealed class BookmarksEvent extends Equatable {}

class BookMarkDogInfoEvent extends BookmarksEvent {
  final DogEntity dogEntity;

  BookMarkDogInfoEvent(this.dogEntity);

  @override
  List<Object?> get props => [dogEntity];
}

class GetBookMarkedDogsEvent extends BookmarksEvent {
  @override
  List<Object?> get props => [];
}

class ClearBookmarksEvent extends BookmarksEvent {
  @override
  List<Object?> get props => [];
}

class RemoveDogInfoBookmarkEvent extends BookmarksEvent {
  final DogEntity dogEntity;

  RemoveDogInfoBookmarkEvent(this.dogEntity);

  @override
  List<Object?> get props => [dogEntity];
}
