import 'dart:io';

import 'package:dio/dio.dart';
import 'package:identitypass_hack/core/service/api_interceptor.dart';

abstract class ApiClient {
  Future<Map<String, dynamic>> checkPollingUnit(
      {String? number, String? lastName, String? state});
}

class RequestError implements Exception {}

class InvalidRequest implements Exception {
  InvalidRequest({this.message});
  final String? message;

  @override
  String toString() {
    return message!;
  }
}

class ApiClientImpl implements ApiClient {
  ApiClientImpl({Dio? dio})
      : _dio = (dio ?? Dio())
          ..options.baseUrl =
              "https://sandbox.myidentitypass.com/api/v1/biometrics/merchant/"
          ..interceptors.add(ApiInterceptor());

  final Dio _dio;

  @override
  Future<Map<String, dynamic>> checkPollingUnit(
      {String? number, String? lastName, String? state}) async {
    try {
      final data = {
        'number': number,
        'last_name': lastName,
        'state': state,
      };
      final response =
          await _dio.post('data/verification/voters_card', data: data);
      if (response.statusCode != HttpStatus.ok) {
        throw RequestError();
      }
      if (response.data['status'] == false) {
        throw InvalidRequest(message: response.data['message']);
      }
      print(response.data);
      return response.data['vc_data'];
    } on DioError catch (e) {
      print(e);
      throw RequestError();
    }
  }
}
