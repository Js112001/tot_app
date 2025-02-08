import 'package:tot_app/core/db/db_services.dart';
import 'package:tot_app/features/discover_dogs/data/data_sources/remote/dog_remote_services.dart';
import 'package:tot_app/features/discover_dogs/data/model/dog_model.dart';
import 'package:tot_app/features/discover_dogs/domain/entity/dog_entity.dart';
import 'package:tot_app/features/discover_dogs/domain/repository/discover_dog_repo.dart';

class DiscoverDogRepoImpl extends DiscoverDogRepo {
  final DogRemoteServices _dogRemoteServices;
  final DbServices _dbServices;

  DiscoverDogRepoImpl(
    this._dogRemoteServices,
    this._dbServices,
  );

  @override
  Future<List<DogModel>> discoverDogs({int limit = 10}) async {
    return await _dogRemoteServices.getDogsListing(limit: limit);
  }

  @override
  Future<int> bookmarkDog({required DogEntity dog}) async {
    return await _dbServices.saveDogInfo(dog: dog);
  }

  @override
  Future<int> clearBookmarks() async {
    return await _dbServices.removeAllDogInfo();
  }

  @override
  Future<List<DogEntity>> fetchBookmarkedDogs() async {
    return await _dbServices.getAllDogsInfo();
  }

  @override
  Future<void> removeDogBookmark({required int id}) async {
    return await _dbServices.removeDogInfo(id: id);
  }
}
