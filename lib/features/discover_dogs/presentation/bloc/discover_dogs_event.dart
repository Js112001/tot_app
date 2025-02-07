part of 'discover_dogs_bloc.dart';

sealed class DiscoverDogsEvent extends Equatable {}

class GetDogsEvent extends DiscoverDogsEvent {
  final int limit;

  GetDogsEvent({this.limit = 10});

  @override
  List<Object?> get props => [limit];
}
