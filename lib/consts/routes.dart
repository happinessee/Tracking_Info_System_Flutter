// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import 'package:capstone/ui/init/initial.dart';
import 'package:capstone/ui/main/check_location_permission_screen.dart';
import 'package:capstone/ui/main/main_screen.dart';
import 'package:capstone/ui/sign_up_sign_in/select_team.dart';
import 'package:capstone/ui/sign_up_sign_in/sign_up.dart';
import 'package:capstone/ui/sign_up_sign_in/sign_up_driver.dart';
import 'package:capstone/ui/sign_up_sign_in/sign_up_end.dart';
import 'package:capstone/ui/sign_up_sign_in/sign_in.dart';
import 'package:capstone/ui/terms_and_conditions/terms_init.dart';
import 'package:capstone/ui/terms_and_conditions/terms_location.dart';
import 'package:capstone/ui/terms_and_conditions/terms_private.dart';
import 'package:capstone/ui/terms_and_conditions/terms_screen_service.dart';
import 'package:capstone/ui/settings/change_location_save_time.dart';

class Routes {
  static const String INITIAL = '/';
  static const String MANAGER_SIGN_UP = '/managerSignUp';
  static const String DRIVER_SIGN_UP = '/driverSignUp';
  static const String SIGN_UP_COMMON = '/signUpCommon';
  static const String SIGN_UP_COMPLETE = '/signUpComplete';
  static const String SIGN_IN = '/signIn';
  static const String CHECK_PERMISSION = '/checkPermission';
  static const String MAIN = '/main';
  static const String SELECT_TEAM = '/selectTeam';
  static const String LOCATION_TERMS = '/locationTerms';
  static const String SETTING_TERMS = '/settingTerms';
  static const String PRIVATE_TERMS = '/privateTerms';
  static const String CHANGE_LOCATION_SAVE_TIME = '/changeLocationSaveTime';

  static Map<String, Widget Function(BuildContext)> routes = {
    INITIAL: (_) => const Initial(),
    MANAGER_SIGN_UP: (_) => SignUp(),
    DRIVER_SIGN_UP: (_) => SignUpDriver(),
    SIGN_UP_COMPLETE: (_) => const SignUpEnd(),
    SIGN_IN: (_) => const SignIn(),
    MAIN: (_) => const MainScreen(),
    CHECK_PERMISSION: (_) => const CheckLocationPermissionScreen(),
    SELECT_TEAM: (_) => const SelectTeam(),
    LOCATION_TERMS: (_) => const TermsLocation(),
    SETTING_TERMS: (_) => const TermsScreen(),
    PRIVATE_TERMS: (_) => const TermsPrivate(),
    CHANGE_LOCATION_SAVE_TIME: (_) => const ChangeLocationSaveTime(),
  };
}
