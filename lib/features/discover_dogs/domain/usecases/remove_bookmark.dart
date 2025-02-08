import 'package:tot_app/core/usecase/usecase.dart';
import 'package:tot_app/features/discover_dogs/domain/repository/discover_dog_repo.dart';

class RemoveBookmarkUseCase extends UseCase<void, int> {
  final DiscoverDogRepo _discoverDogRepo;

  RemoveBookmarkUseCase(this._discoverDogRepo);

  @override
  Future<void> call({required int request}) async {
    await _discoverDogRepo.removeDogBookmark(id: request);
  }
}
