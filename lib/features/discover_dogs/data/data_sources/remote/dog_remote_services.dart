import 'package:tot_app/core/network/base_network.dart';
import 'package:tot_app/features/discover_dogs/data/model/dog_model.dart';
import 'package:tot_app/utils/enums/enums.dart';
import 'package:tot_app/utils/logger/app_logger.dart';

sealed class DogRemoteServices {
  Future<void> getDogsListing({int? limit = 10});
}

class DogRemoteServicesImpl extends DogRemoteServices {
  final BaseNetwork _baseNetwork;

  DogRemoteServicesImpl(this._baseNetwork);

  @override
  Future<void> getDogsListing({int? limit = 10}) async {
    final result = await _baseNetwork.sendRequest(
      method: NetworkRequestMethod.get,
      endpoint: '',
      queryParameters: {
        'limit': '$limit',
      },
      fromJson: (response) => dogModelFromJson,
    );

    AppLogger.d('[Result]: $result');
  }
}
