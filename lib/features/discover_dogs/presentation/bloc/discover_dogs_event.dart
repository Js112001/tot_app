part of 'discover_dogs_bloc.dart';

sealed class DiscoverDogsEvent extends Equatable {}

class InitialEvent extends DiscoverDogsEvent {
  @override
  List<Object?> get props => [];
}
