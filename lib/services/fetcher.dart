import 'dart:convert';
import 'package:http/http.dart' as http;

class Fetch {
  final String url;

  Fetch(this.url);

  Future<dynamic> getData(String? token) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    if (token != null) {
      headers['Authorization'] = token;
    }

    http.Response response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      throw Exception('Failed to get data');
    }
  }

  Future<dynamic> postData(Map<String, dynamic> data, {String? token}) async {
    try {
      Map<String, String> headers = {'Content-Type': 'application/json'};
      if (token != null) {
        headers['Authorization'] = token;
      }

      print(url);
      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: headers,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        String responseData = response.body;
        return jsonDecode(responseData);
      } else if (response.statusCode == 500 ||
          response.statusCode == 400 ||
          response.statusCode == 404) {
        Map<String, dynamic> errorResponse = jsonDecode(response.body);
        String errorMessage = errorResponse['message'];
        print('Server Error: $errorMessage');
        return {'error': errorMessage};
      } else {
        return {'error': 'Failed to post data'};
      }
    } catch (e) {
      String errorMessage = e.toString();
      print('Error: $errorMessage');
      return {'error': errorMessage};
    }
  }

  Future<dynamic> putData(Map<String, dynamic> data,
      {required String token}) async {
    try {
      Map<String, String> headers = {'Content-Type': 'application/json'};
      headers['Authorization'] = token;

      http.Response response = await http.put(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: headers,
      );
      print("data");
      print(data);
      print(response.body);
      print(url);

      if (response.statusCode == 200) {
        String responseData = response.body;
        return jsonDecode(responseData);
      } else if (response.statusCode == 400 || response.statusCode == 404) {
        Map<String, dynamic> errorResponse = jsonDecode(response.body);
        String errorMessage = errorResponse['message'];
        print('Server Error: $errorMessage');
        return {'error': errorMessage};
      } else {
        return {'error': 'Failed to update data'};
      }
    } catch (e) {
      String errorMessage = e.toString();
      print('Error: $errorMessage');
      return {'error': errorMessage};
    }
  }
}
