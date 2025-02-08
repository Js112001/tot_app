import 'package:tot_app/features/discover_dogs/domain/entity/dog_entity.dart';

abstract class DbServices {
  Future<List<DogEntity>> getAllDogsInfo();

  Future<int> saveDogInfo({required DogEntity dog});

  Future<void> removeDogInfo({required int id});

  Future<int> removeAllDogInfo();
}
