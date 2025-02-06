part of 'discover_dogs_bloc.dart';

sealed class DiscoverDogsState extends Equatable {}

class InitialState extends DiscoverDogsState {
  @override
  List<Object?> get props => [];
}
