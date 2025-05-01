import 'package:SmartTrolleyWebsite/Utils/ApiHelper.dart';
import 'package:get/get.dart';

import 'ApiHandler.dart';

class ApiFunction extends GetxService {
  final ApiHandler _apiHandler = ApiHandler();


  Future<ApiFunction> init() async {
    return this;
  }


  Future<Map<String, dynamic>> createClientRequest(
      String name, String email, int mobileNumber) async {
    final String endpoint = ApiHelper.clientrequest;

    final Map<String, dynamic> requestBody = {
      'name': name,
      'email': email,
      'mobileNumber': mobileNumber,
    };

    print("request: $requestBody");

    try {
      final responseData = await _apiHandler.postRequest(
        endpoint,
        requestBody,
      );

      return responseData;
    } catch (e) {
      return {
        'success': false,
        'error': 'Exception occurred: $e',
      };
    }
  }
}
