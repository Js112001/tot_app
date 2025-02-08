import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tot_app/features/discover_dogs/domain/entity/dog_entity.dart';
import 'package:tot_app/features/discover_dogs/domain/usecases/fetch_bookmarked_dogs.dart';
import 'package:tot_app/features/discover_dogs/domain/usecases/get_dogs.dart';
import 'package:tot_app/utils/logger/app_logger.dart';

part 'discover_dogs_event.dart';
part 'discover_dogs_state.dart';

class DiscoverDogsBloc extends Bloc<DiscoverDogsEvent, DiscoverDogsState> {
  final GetDogsUseCase _getDogsUseCase;
  final FetchBookmarkedDogsUseCase _fetchBookmarkedDogsUseCase;

  DiscoverDogsBloc(
    this._getDogsUseCase,
    this._fetchBookmarkedDogsUseCase,
  ) : super(DiscoverDogsLoadingState()) {
    on<InitialEvent>(_onInitialEvent);
    on<GetDogsEvent>(_onGetDogsEvent);
  }

  void _onInitialEvent(
    InitialEvent event,
    Emitter<DiscoverDogsState> emit,
  ) {
    emit(DiscoverDogsLoadingState());
  }

  void _onGetDogsEvent(
    GetDogsEvent event,
    Emitter<DiscoverDogsState> emit,
  ) async {
    AppLogger.i('[Limit]: ${event.limit}');
    if (event.limit > 10) {
      emit(
        GetDogsDataSuccessState(
          dogs: [],
          totalDocs: event.limit - 10,
          isPaginated: true,
        ),
      );
    } else {
      emit(DiscoverDogsLoadingState());
    }
    try {
      final apiResponse = await _getDogsUseCase(request: event.limit);
      var bookmarkedDogs = await _fetchBookmarkedDogsUseCase();

      final response = apiResponse.map(
        (DogEntity item) {
          bool isExists =
              bookmarkedDogs.any((localDog) => localDog.id == item.id);
          if (isExists) {
            final newItem = item.copyWith(isBookmarked: true);
            return newItem;
          } else {
            return item;
          }
        },
      ).toList();
      emit(GetDogsDataSuccessState(
        dogs: response,
        totalDocs: response.length,
        isPaginated: false,
      ));
    } catch (e) {
      emit(DiscoverDogsErrorState(message: e.toString()));
    }
  }
}
