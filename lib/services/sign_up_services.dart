import 'package:capstone/consts/default.dart';
import 'package:capstone/consts/storage_key.dart';
import 'package:capstone/services/http.dart';
import 'package:capstone/services/string_processing.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpServices {
  static Future<bool> receiveSmsAuth(String phoneNumber) async {
    try {
      await dio.post('/accounts/send-sms/', data: {
        'phone_number': StringProcessing.removeSpaceDash(phoneNumber),
        'purpose': 'register',
      });
      return true;
    } on DioError catch (e) {
      return false;
    }
  }

  static Future<bool> sendSmsAuth(String phoneNumber, String authNumber) async {
    try {
      Response response = await dio.post('/accounts/verify-sms/', data: {
        'phone_number': StringProcessing.removeSpaceDash(phoneNumber),
        'auth_number': authNumber,
        'purpose': 'register',
      });
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          StorageKey.VERIFICATION_TOKEN, response.data['verification_token']);
      return true;
    } on DioError catch (e) {
      return false;
    }
  }

  static Future<bool> signUpProtector(String userName) async {
    try {
      Response response = await dio.post(
        '/accounts/signup/protector/',
        data: {
          'username': userName,
        },
        options: Options(
          headers: await Default.VERIFICATION_HEADER(),
        ),
      );
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(StorageKey.ACCESS_TOKEN, response.data['access']);
      await prefs.setString(StorageKey.REFRESH_TOKEN, response.data['refresh']);
      return true;
    } on DioError catch (e) {
      return false;
    }
  }

  static Future<bool> signUpPatient() async {
    try {
      Response response = await dio.post(
        '/accounts/signup/',
        options: Options(
          headers: await Default.VERIFICATION_HEADER(),
        ),
      );
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(StorageKey.ACCESS_TOKEN, response.data['access']);
      await prefs.setString(StorageKey.REFRESH_TOKEN, response.data['refresh']);
      return true;
    } on DioError catch (e) {
      return false;
    }
  }
}
