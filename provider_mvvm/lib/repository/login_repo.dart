import 'package:flutter/foundation.dart';
import 'package:provider_mvvm/data/network/base_api_sarvices.dart';
import 'package:provider_mvvm/data/network/network_api_sarvices.dart';
import 'package:provider_mvvm/resourses/api_urls.dart';
import 'package:provider_mvvm/utils/utils.dart';

class LoginRepository {
  BaseApiServices loginSarvices = NetworkApiSarvices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await loginSarvices.getPostApiResponse(
          ApiUrl.baseUrl + ApiUrl.loginUrl, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw e;
    }
  }
}
