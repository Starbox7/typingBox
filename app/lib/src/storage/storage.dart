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

Future<Map<String, String>> getTokens() async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  String accessToken = storage.getString('accessToken') ?? '';
  String refreshToken = storage.getString('refreshToken') ?? '';
  return {'accessToken': accessToken, 'refreshToken': refreshToken};
}
