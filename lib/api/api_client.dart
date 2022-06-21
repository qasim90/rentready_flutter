import 'dart:convert';

import 'package:http/http.dart' as http;

class Resource<T> {
  final String url;
  T Function(http.Response response) parse;

  Resource({required this.url, required this.parse});
}

class Api {
  get_(url) async {
    print('api url: $url');
    final response = await http.get(Uri.parse(url));
    print('GET response: ${response.statusCode} ${response.body}');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data!');
    }
  }

  post_(String url, params) async {
    print('POST url: $url');
    final response = await http.post(Uri.parse(url), body: params);
    print('POST response: ${response.body}');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw (getMeaningfulError(response));
    }
  }

  String getMeaningfulError(http.Response response) {
    var errorMsg = '';
    try {
      var jsonError = jsonDecode(response.body);
      if (jsonError is List) {
        for (var e in jsonError) {
          errorMsg += e['message'] + '\n';
        }
        print('eerros: $errorMsg');
      } else {
        errorMsg = jsonError['message'];
      }
    } catch (e) {
      errorMsg = '${response.statusCode}: ${response.body}';
    }

    return errorMsg;
  }
}
