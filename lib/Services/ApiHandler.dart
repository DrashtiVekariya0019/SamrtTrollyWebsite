import 'dart:convert';
import 'package:SmartTrolleyWebsite/Utils/ApiHelper.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class ApiHandler {
  Future<Map<String, dynamic>> getRequest(String endpoint) async {
    final url = Uri.parse('${ApiHelper.baseUrl}$endpoint');
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      return _handleResponse(response);
    } catch (e) {
      return {'success': false, 'error': 'An error occurred: $e'};
    }
  }

  Future<Map<String, dynamic>> postRequest(
      String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('${ApiHelper.baseUrl}$endpoint');
    try {
      print('URL Details:- ${url}');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 201) {
        return _handleResponse(response);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return {'success': false, 'error': 'An error occurred: $e'};
    }
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    var details = jsonDecode(response.body);

    switch (details['status']) {
      case 200:
      case 201: // Created
        print('Get Data :- ${details['message']}');
        return details;
      case 400: // Bad Request
        return details;
      case 401: // Unauthorized
      case 402: // Payment Required
      case 403: // Forbidden
        return details;
      case 404: // Not Found
        return details;
      case 500: // Internal Server Error
        return {
          'success': false,
          'error': 'Internal server error: ${response.body}'
        };
      case 503: // Service Unavailable
        return {
          'success': false,
          'error': 'Service unavailable: ${response.body}'
        };
      default:
        return {
          'success': false,
          'error': 'Unexpected error (${response.statusCode}): ${response.body}'
        };
    }
  }
}