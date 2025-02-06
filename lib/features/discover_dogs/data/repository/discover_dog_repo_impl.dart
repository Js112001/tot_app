import 'package:tot_app/features/discover_dogs/data/data_sources/remote/dog_remote_services.dart';
import 'package:tot_app/features/discover_dogs/data/model/dog_model.dart';
import 'package:tot_app/features/discover_dogs/domain/repository/discover_dog_repo.dart';

class DiscoverDogRepoImpl extends DiscoverDogRepo {
  final DogRemoteServices _dogRemoteServices;

  DiscoverDogRepoImpl(this._dogRemoteServices);

  @override
  Future<List<DogModel>> discoverDogs() async {
    _dogRemoteServices.getDogsListing();
    return [];
  }
}
