import 'package:tot_app/features/discover_dogs/domain/entity/dog_entity.dart';

abstract class DiscoverDogRepo {
  Future<List<DogEntity>> discoverDogs({int limit});
  Future<int> bookmarkDog({required DogEntity dog});
  Future<int> clearBookmarks();
  Future<List<DogEntity>> fetchBookmarkedDogs();
  Future<void> removeDogBookmark({required int id});
}
