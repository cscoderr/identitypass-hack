// ignore_for_file: unnecessary_null_comparison, file_names

import 'dart:async';

import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ApiInterceptor extends Interceptor {
  @override
  Future<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var token = prefs.getString('token');

    // if (options.headers['hasToken']) {
    options.headers.addAll({
      'x-api-key': 'test_cn5c1mecu1gj18xbf9cu07:JzQfkUE8_ARRd9w1zPH658XuwrQ'
    });
    // options.headers.remove('hasToken');
    // } else {
    //   options.headers.remove('hasToken');
    // }
    // options.headers.forEach((k, v) => log('$k: $v'));
    // if (options.queryParameters != null) {
    //   print('queryParameters:');
    //   options.queryParameters.forEach((k, v) => print('$k: $v'));
    // }
    // if (options.data != null) {
    //   print('Body: ${options.data}');
    // }
    // print("--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");

    // options.headers.addAll({"X-Api-Key": "${Globals.xAPIKey}"});

    return super.onRequest(options, handler);
  }
}

@override
Future onResponse(Response response, ResponseInterceptorHandler handler) async {
  // print('RESPONSE[${response.statusCode}] => PATH: ${response.request?.path}');
  // print('Headers:');
  // response.headers.forEach((k, v) => log('$k: $v'));
  print('Response: ${response.data}');
  // print('<-- END HTTP');
  // }
  return handler.next(response);
}
