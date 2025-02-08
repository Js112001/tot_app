import 'package:tot_app/core/usecase/usecase.dart';
import 'package:tot_app/features/discover_dogs/domain/entity/dog_entity.dart';
import 'package:tot_app/features/discover_dogs/domain/repository/discover_dog_repo.dart';

class FetchBookmarkedDogsUseCase extends UseCase<List<DogEntity>, void> {
  final DiscoverDogRepo _discoverDogRepo;

  FetchBookmarkedDogsUseCase(this._discoverDogRepo);

  @override
  Future<List<DogEntity>> call({void request}) async {
    return await _discoverDogRepo.fetchBookmarkedDogs();
  }
}
