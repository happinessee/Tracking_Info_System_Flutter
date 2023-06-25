import 'package:flutter/material.dart';

import 'package:capstone/blocs/multi_bloc_provider.dart';
import 'package:capstone/consts/colors.dart';
import 'package:capstone/consts/routes.dart';

import 'package:capstone/services/http.dart';
import 'package:capstone/services/tokens.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  configureDio();
  WidgetsFlutterBinding.ensureInitialized();

  KakaoSdk.init(
    nativeAppKey: '7cc55f770d5b31f7b077811cc2636460',
    javaScriptAppKey: 'bc51daa849509ca38dffc5df41c91ccc',
  );

  runApp(
    multiBlocProvider(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Tokens.isLoggedIn(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
            title: 'Capstone',
            routes: Routes.routes,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              navigationBarTheme: const NavigationBarThemeData(
                labelTextStyle: MaterialStatePropertyAll(
                  TextStyle(fontSize: 13, color: GColors.BLACK),
                ),
              ),
            ),
            navigatorKey: MyApp.navigatorKey,
            initialRoute: snapshot.data! ? Routes.MAIN : Routes.INITIAL,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
