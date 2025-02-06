import 'package:tot_app/core/usecase/usecase.dart';
import 'package:tot_app/features/discover_dogs/domain/repository/discover_dog_repo.dart';

class GetDogsUseCase extends UseCase<void, void> {
  final DiscoverDogRepo _discoverDogRepo;

  GetDogsUseCase(this._discoverDogRepo);

  @override
  Future<void> call({void request}) async {
    _discoverDogRepo.discoverDogs();
  }
}
