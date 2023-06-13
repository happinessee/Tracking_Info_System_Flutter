// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:capstone/consts/storage_key.dart';
import 'package:capstone/services/tokens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Default {
  static const String DEMENTIA_URL = 'http://101.79.10.119:10500';
  static const HEADER_DEFAULT = {'Content-Type': 'application/json'};
  static const double DEFAULT_LAT = 37.458353;
  static const double DEFAULT_LNG = 126.948386;

  static Future<Map<String, String>> VERIFICATION_HEADER() async {
    final prefs = await SharedPreferences.getInstance();
    final header = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer ${prefs.getString(StorageKey.VERIFICATION_TOKEN)}'
    };
    return header;
  }

  static Future<Map<String, String>> HEADER_TOKEN() async {
    await Tokens.isExpired();
    final prefs = await SharedPreferences.getInstance();
    final header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${prefs.getString(StorageKey.ACCESS_TOKEN)}'
    };
    return header;
  }

  static Map<String, String> KAKAO_HEADER(String token) {
    final header = {
      'Content-Type': 'application/json',
      'Authorization': 'KakaoAK $token'
    };
    return header;
  }
}
