import 'package:tot_app/core/usecase/usecase.dart';
import 'package:tot_app/features/discover_dogs/domain/entity/dog_entity.dart';
import 'package:tot_app/features/discover_dogs/domain/repository/discover_dog_repo.dart';

class GetDogsUseCase extends UseCase<List<DogEntity>, int> {
  final DiscoverDogRepo _discoverDogRepo;

  GetDogsUseCase(this._discoverDogRepo);

  @override
  Future<List<DogEntity>> call({int request = 10}) async {
    return await _discoverDogRepo.discoverDogs(limit: request);
  }
}
