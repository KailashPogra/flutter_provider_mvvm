import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:provider_mvvm/data/app_exceptions.dart';
import 'package:provider_mvvm/data/network/base_api_sarvices.dart';
import 'package:http/http.dart' as http;

class NetworkApiSarvices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      var response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FatchDataException('no internet connection');
    } on TimeoutException {
      throw TimeoutException('request timed out');
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, data) async {
    dynamic responseJson;
    try {
      var response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FatchDataException('no internet connection');
    } on TimeoutException {
      throw TimeoutException('request timed out');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FatchDataException(
            'error occur while communicating with server with status code: ${response.statusCode}');
    }
  }
}
