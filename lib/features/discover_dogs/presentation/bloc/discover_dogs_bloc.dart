import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tot_app/features/discover_dogs/domain/entity/dog_entity.dart';
import 'package:tot_app/features/discover_dogs/domain/usecases/get_dogs.dart';

part 'discover_dogs_event.dart';
part 'discover_dogs_state.dart';

class DiscoverDogsBloc extends Bloc<DiscoverDogsEvent, DiscoverDogsState> {
  final GetDogsUseCase _getDogsUseCase;

  DiscoverDogsBloc(this._getDogsUseCase) : super(DiscoverDogsLoadingState()) {
    on<GetDogsEvent>(_onGetDogsEvent);
  }

  void _onGetDogsEvent(
      GetDogsEvent event, Emitter<DiscoverDogsState> emit) async {
    if (event.limit == 10) {
      emit(DiscoverDogsLoadingState());
    } else {
      emit(
        GetDogsDataSuccessState(
          dogs: [],
          totalDocs: event.limit - 10,
          isPaginated: true,
        ),
      );
    }
    try {
      final response = await _getDogsUseCase(request: event.limit);
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
