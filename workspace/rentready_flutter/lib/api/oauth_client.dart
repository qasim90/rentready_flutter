import 'package:oauth2_client/oauth2_client.dart';

class OAuthClient extends OAuth2Client {
  OAuthClient({required String redirectUri, required String customUriScheme})
      : super(
            authorizeUrl:
                'https://login.microsoftonline.com/common/oauth2/authorize', //Your service's authorization url
            tokenUrl: 'https://login.microsoftonline.com/common/oauth2/authorize', //Your service access token url
            redirectUri: redirectUri,
            customUriScheme: customUriScheme);
}
