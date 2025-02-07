import 'package:tot_app/features/discover_dogs/domain/entity/dog_entity.dart';

abstract class DiscoverDogRepo {
  Future<List<DogEntity>> discoverDogs({int limit});
}
