import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tot_app/features/discover_dogs/domain/entity/dog_entity.dart';
import 'package:tot_app/features/discover_dogs/domain/usecases/bookmark_dog.dart';
import 'package:tot_app/features/discover_dogs/domain/usecases/clear_bookmarks.dart';
import 'package:tot_app/features/discover_dogs/domain/usecases/fetch_bookmarked_dogs.dart';
import 'package:tot_app/features/discover_dogs/domain/usecases/remove_bookmark.dart';

part 'bookmarks_event.dart';
part 'bookmarks_state.dart';

class BookmarksBloc extends Bloc<BookmarksEvent, BookmarksState> {
  final BookmarkDogUseCase _bookmarkDogUseCase;
  final FetchBookmarkedDogsUseCase _fetchBookmarkedDogsUseCase;
  final ClearBookmarksUseCase _clearBookmarksUseCase;
  final RemoveBookmarkUseCase _removeBookmarkUseCase;

  BookmarksBloc(
    this._bookmarkDogUseCase,
    this._fetchBookmarkedDogsUseCase,
    this._clearBookmarksUseCase,
    this._removeBookmarkUseCase,
  ) : super(InitialBookmarkState()) {
    on<BookMarkDogInfoEvent>(_onBookMarkDogInfoEvent);
    on<GetBookMarkedDogsEvent>(_onGetBookMarkedDogsEvent);
    on<ClearBookmarksEvent>(_onClearBookmarksEvent);
    on<RemoveDogInfoBookmarkEvent>(_onRemoveDogInfoBookmarkEvent);
  }

  void _onBookMarkDogInfoEvent(
    BookMarkDogInfoEvent event,
    Emitter<BookmarksState> emit,
  ) async {
    final result = await _bookmarkDogUseCase(
        request: event.dogEntity.copyWith(isBookmarked: true));
    if (result > 0) {
      emit(
        BookMarkedState(
          message: 'Dog named ${event.dogEntity.name} bookmarked',
          isSuccess: true,
          dog: event.dogEntity.copyWith(isBookmarked: true),
        ),
      );
    } else {
      emit(
        BookMarkedState(
          message:
              'Unable to bookmark dog named ${event.dogEntity.name}. Please try again.',
          isSuccess: false,
          dog: event.dogEntity,
        ),
      );
    }
  }

  void _onGetBookMarkedDogsEvent(
    GetBookMarkedDogsEvent event,
    Emitter<BookmarksState> emit,
  ) async {
    emit(BookmarkLoadingState());
    final result = await _fetchBookmarkedDogsUseCase();
    emit(FetchBookmarksState(result));
  }

  void _onClearBookmarksEvent(
    ClearBookmarksEvent event,
    Emitter<BookmarksState> emit,
  ) async {
    emit(BookmarkLoadingState());

    final result = await _clearBookmarksUseCase();

    if (result > 0) {
      emit(BookMarkedState(
        message: 'Cleared all bookmarks',
        isSuccess: true,
        dog: DogEntity(),
      ));
      emit(FetchBookmarksState([]));
    } else {
      final allBookmarks = await _fetchBookmarkedDogsUseCase();
      emit(FetchBookmarksState(allBookmarks));
    }
  }

  void _onRemoveDogInfoBookmarkEvent(
    RemoveDogInfoBookmarkEvent event,
    Emitter<BookmarksState> emit,
  ) async {
    await _removeBookmarkUseCase(request: event.dogEntity.id ?? 0);
    emit(RemoveBookmarkState(
      message: 'Removed ${event.dogEntity.name} from bookmark',
      dog: event.dogEntity.copyWith(isBookmarked: false),
    ));
  }
}
