import 'package:app/src/utils/custom_error.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> setTokens(String accessToken, String refreshToken) async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  storage.setString('accessToken', accessToken);
  storage.setString('refreshToken', refreshToken);
}

Future<void> removeTokens() async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  storage.setString('accessToken', '');
  storage.setString('refreshToken', '');
}

Future<void> checkTokens() async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  String accessToken = storage.getString('accessToken') ?? '';
  String refreshToken = storage.getString('refreshToken') ?? '';

  if ('' == accessToken) {
    throw TokenError(message: 'ACCESS TOKEN IS NULL');
  }
  if ('' == refreshToken) {
    throw TokenError(message: 'REFRESH TOKEN IS NULL');
  }
}

Future<Map<String, String>> getTokens() async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  String accessToken = storage.getString('accessToken') ?? '';
  String refreshToken = storage.getString('refreshToken') ?? '';
  if ('' == accessToken) {
    throw TokenError(message: 'ACCESS TOKEN IS NULL');
  }
  if ('' == refreshToken) {
    throw TokenError(message: 'REFRESH TOKEN IS NULL');
  }

  return {'accessToken': accessToken, 'refreshToken': refreshToken};
}

Future<void> setAccessToken(String accessToken) async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  storage.setString('accessToken', accessToken);
}
