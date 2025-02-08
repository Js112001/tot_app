import 'package:hive/hive.dart';
import 'package:tot_app/core/db/db_services.dart';
import 'package:tot_app/features/discover_dogs/domain/entity/dog_entity.dart';
import 'package:tot_app/utils/logger/app_logger.dart';

class HiveDbServices extends DbServices {
  static String _boxName = 'bookmarked-dogs';

  @override
  Future<int> saveDogInfo({required DogEntity dog}) async {
    try {
      final box = await Hive.openBox<DogEntity>(_boxName);
      await box.put(dog.id, dog);

      return dog.id ?? 0;
    } catch (e) {
      AppLogger.e('[DbException]: $e');
      return -1;
    }
  }

  @override
  Future<void> removeDogInfo({required int id}) async {
    final box = await Hive.openBox<DogEntity>(_boxName);
    await box.delete(id);
  }

  @override
  Future<int> removeAllDogInfo() async {
    final box = await Hive.openBox<DogEntity>(_boxName);
    return await box.clear();
  }

  @override
  Future<List<DogEntity>> getAllDogsInfo() async {
    final box = await Hive.openBox<DogEntity>(_boxName);
    final values = await box.values.toList();
    return values;
  }
}
