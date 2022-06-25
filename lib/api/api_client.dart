import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:rr_qasim_assign/api/oauth_client.dart';
import 'package:rr_qasim_assign/constants.dart';

class Api {
  static Api instance = Api._internal();
  Api._internal();

  factory Api() {
    return instance;
  }

  //Instantiate an OAuth2Client...
  OAuthClient client = OAuthClient(
    customUriScheme: 'http', //Must correspond to the AndroidManifest's "android:scheme" attribute
    redirectUri: 'msauth.rr://auth', //Can be any URI, but the scheme part must correspond to the customeUriScheme
  );

  get_(url) async {
    print('api url: $url');

    OAuth2Helper oauth2Helper = OAuth2Helper(client,
        grantType: OAuth2Helper.IMPLICIT_GRANT,
        clientId: oAuthClientId,
        enableState: false,
        authCodeParams: {"resource": "https://org696577ed.crm4.dynamics.com"}
        // clientSecret: 'your_client_secret',
        // scopes: ['https://www.googleapis.com/auth/drive.readonly']
        );

    // final response = await http.get(Uri.parse(url));
    final http.Response response = await oauth2Helper.get(url);
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
