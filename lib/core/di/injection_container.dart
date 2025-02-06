import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tot_app/core/network/base_network.dart';
import 'package:tot_app/core/network/dio_client.dart';
import 'package:tot_app/features/discover_dogs/data/data_sources/remote/dog_remote_services.dart';
import 'package:tot_app/features/discover_dogs/data/repository/discover_dog_repo_impl.dart';
import 'package:tot_app/features/discover_dogs/domain/repository/discover_dog_repo.dart';
import 'package:tot_app/features/discover_dogs/domain/usecases/get_dogs.dart';
import 'package:tot_app/features/discover_dogs/presentation/bloc/discover_dogs_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // network
  sl.registerSingleton<Dio>(DioClient.createDio());
  sl.registerSingleton<BaseNetwork>(BaseNetwork(sl()));

  // services
  sl.registerSingleton<DogRemoteServices>(DogRemoteServicesImpl(sl()));

  // repos
  sl.registerSingleton<DiscoverDogRepo>(DiscoverDogRepoImpl(sl()));

  // usecases
  sl.registerSingleton<GetDogsUseCase>(GetDogsUseCase(sl()));

  // bloc
  sl.registerFactory<DiscoverDogsBloc>(
    () => DiscoverDogsBloc(sl()),
  );
}
