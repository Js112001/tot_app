import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tot_app/core/db/db_services.dart';
import 'package:tot_app/core/db/hive_db_services.dart';
import 'package:tot_app/core/network/base_network.dart';
import 'package:tot_app/core/network/dio_client.dart';
import 'package:tot_app/features/discover_dogs/data/data_sources/remote/dog_remote_services.dart';
import 'package:tot_app/features/discover_dogs/data/repository/discover_dog_repo_impl.dart';
import 'package:tot_app/features/discover_dogs/domain/repository/discover_dog_repo.dart';
import 'package:tot_app/features/discover_dogs/domain/usecases/bookmark_dog.dart';
import 'package:tot_app/features/discover_dogs/domain/usecases/clear_bookmarks.dart';
import 'package:tot_app/features/discover_dogs/domain/usecases/fetch_bookmarked_dogs.dart';
import 'package:tot_app/features/discover_dogs/domain/usecases/get_dogs.dart';
import 'package:tot_app/features/discover_dogs/domain/usecases/remove_bookmark.dart';
import 'package:tot_app/features/discover_dogs/presentation/bloc/bookmarks/bookmarks_bloc.dart';
import 'package:tot_app/features/discover_dogs/presentation/bloc/discover_dogs/discover_dogs_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // network
  sl.registerSingleton<Dio>(DioClient.createDio());
  sl.registerSingleton<BaseNetwork>(BaseNetwork(sl()));

  // services
  sl.registerSingleton<DogRemoteServices>(DogRemoteServicesImpl(sl()));
  sl.registerSingleton<DbServices>(HiveDbServices());

  // repos
  sl.registerSingleton<DiscoverDogRepo>(DiscoverDogRepoImpl(sl(), sl()));

  // usecases
  sl.registerSingleton<GetDogsUseCase>(GetDogsUseCase(sl()));
  sl.registerSingleton<BookmarkDogUseCase>(BookmarkDogUseCase(sl()));
  sl.registerSingleton<FetchBookmarkedDogsUseCase>(
      FetchBookmarkedDogsUseCase(sl()));
  sl.registerSingleton<ClearBookmarksUseCase>(ClearBookmarksUseCase(sl()));
  sl.registerSingleton<RemoveBookmarkUseCase>(RemoveBookmarkUseCase(sl()));

  // bloc
  sl.registerFactory<DiscoverDogsBloc>(
    () => DiscoverDogsBloc(sl(), sl()),
  );
  sl.registerFactory<BookmarksBloc>(
    () => BookmarksBloc(sl(), sl(), sl(), sl()),
  );
}
