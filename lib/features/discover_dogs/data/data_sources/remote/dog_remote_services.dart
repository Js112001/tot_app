import 'package:tot_app/core/network/base_network.dart';
import 'package:tot_app/features/discover_dogs/data/model/dog_model.dart';
import 'package:tot_app/utils/enums/enums.dart';

sealed class DogRemoteServices {
  Future<List<DogModel>> getDogsListing({int limit = 10});
}

class DogRemoteServicesImpl extends DogRemoteServices {
  final BaseNetwork _baseNetwork;

  DogRemoteServicesImpl(this._baseNetwork);

  @override
  Future<List<DogModel>> getDogsListing({int limit = 10}) async {
    return await _baseNetwork.sendRequest(
      method: NetworkRequestMethod.get,
      endpoint: '',
      queryParameters: {
        'limit': '$limit',
      },
      fromJson: (response) {
        // AppLogger.i('[Limit]: $limit');
        var result = response as List<dynamic>;
        return result.map((item) {
          return DogModel.fromJson(item);
        }).toList();
      },
    );
  }
}
