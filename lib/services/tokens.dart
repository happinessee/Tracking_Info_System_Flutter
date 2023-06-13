import 'package:capstone/consts/storage_key.dart';
import 'package:capstone/services/http.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class Tokens {
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(StorageKey.REFRESH_TOKEN) != null) return true;
    return false;
  }

  static Future<bool> _refreshToken() async {
    final prefs = await SharedPreferences.getInstance();

    try {
      Response response = await dio.post('/accounts/refresh/', data: {
        'refresh': prefs.getString(StorageKey.REFRESH_TOKEN),
      });
      await prefs.setString(StorageKey.ACCESS_TOKEN, response.data['access']);
      await prefs.setString(StorageKey.REFRESH_TOKEN, response.data['refresh']);
      return response.statusCode == 200;
    } on DioError catch (e) {
      return false;
    }
  }

  static Future<void> isExpired() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString(StorageKey.ACCESS_TOKEN)!;
    final refreshToken = prefs.getString(StorageKey.REFRESH_TOKEN)!;
    print('** access Token : $accessToken');
    print('*** refresh Token : $refreshToken');
    if (JwtDecoder.isExpired(accessToken)) {
      print('expire');
      await _refreshToken();
    }
    print('ok');
  }
}
