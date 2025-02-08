import 'package:tot_app/core/usecase/usecase.dart';
import 'package:tot_app/features/discover_dogs/domain/repository/discover_dog_repo.dart';

class ClearBookmarksUseCase extends UseCase<int, void> {
  final DiscoverDogRepo _discoverDogRepo;

  ClearBookmarksUseCase(this._discoverDogRepo);

  @override
  Future<int> call({void request}) async {
    return await _discoverDogRepo.clearBookmarks();
  }
}
