import 'package:identitypass_hack/core/model/polling_unit.dart';
import 'package:identitypass_hack/core/service/api_client.dart';

class PollingUnitError implements Exception {}

class PollingUnitNotFound implements Exception {
  PollingUnitNotFound({this.message});
  final String? message;

  @override
  String toString() {
    return message!;
  }
}

class ApiRepository {
  ApiRepository({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClientImpl();

  final ApiClient _apiClient;

  Future<PollingUnit> getPollingUnit(
      {String? number, String? lastName, String? state}) async {
    try {
      final response = await _apiClient.checkPollingUnit(
          number: number, lastName: lastName, state: state);
      return PollingUnit.fromJson(response);
    } on InvalidRequest catch (e) {
      throw PollingUnitNotFound(message: e.toString());
    } on RequestError {
      throw PollingUnitError();
    }
  }
}
