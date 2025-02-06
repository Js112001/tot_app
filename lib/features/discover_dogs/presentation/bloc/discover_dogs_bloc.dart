import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tot_app/features/discover_dogs/domain/usecases/get_dogs.dart';

part 'discover_dogs_event.dart';
part 'discover_dogs_state.dart';

class DiscoverDogsBloc extends Bloc<DiscoverDogsEvent, DiscoverDogsState> {
  final GetDogsUseCase _getDogsUseCase;

  DiscoverDogsBloc(this._getDogsUseCase) : super(InitialState()) {
    on<InitialEvent>(_onInitialEvent);
  }

  void _onInitialEvent(
      InitialEvent event, Emitter<DiscoverDogsState> emit) async {
    _getDogsUseCase();
    emit(InitialState());
  }
}
