import 'package:capstone/consts/default.dart';

import 'package:dio/dio.dart';

export 'package:dio/dio.dart';

final dio = Dio();

void configureDio() {
  dio.options.baseUrl = Default.DEMENTIA_URL;
}
