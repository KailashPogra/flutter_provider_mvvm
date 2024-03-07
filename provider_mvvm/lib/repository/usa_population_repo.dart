import 'package:flutter/foundation.dart';
import 'package:provider_mvvm/data/network/base_api_sarvices.dart';
import 'package:provider_mvvm/data/network/network_api_sarvices.dart';

import 'package:provider_mvvm/model/usa_population_model.dart';
import 'package:provider_mvvm/resourses/api_urls.dart';

class UsaPopulationRepository {
  BaseApiServices usaPopulationSarvices = NetworkApiSarvices();

  Future<UsaPopulationModel> getUsaPopulationApi() async {
    try {
      dynamic response = await usaPopulationSarvices
          .getGetApiResponse(ApiUrl.usaPopulationApiUrl);
      return response = UsaPopulationModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw e;
    }
  }
}
