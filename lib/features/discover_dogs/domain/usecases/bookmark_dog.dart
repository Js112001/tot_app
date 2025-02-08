import 'package:tot_app/core/usecase/usecase.dart';
import 'package:tot_app/features/discover_dogs/domain/entity/dog_entity.dart';
import 'package:tot_app/features/discover_dogs/domain/repository/discover_dog_repo.dart';

class BookmarkDogUseCase extends UseCase<int, DogEntity> {
  final DiscoverDogRepo _discoverDogRepo;

  BookmarkDogUseCase(this._discoverDogRepo);

  @override
  Future<int> call({
    required DogEntity request,
  }) async {
    return await _discoverDogRepo.bookmarkDog(dog: request);
  }
}
