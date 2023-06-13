import 'package:flutter/material.dart';

import 'package:capstone/consts/colors.dart';
import 'package:capstone/consts/routes.dart';
import 'package:capstone/main.dart';

import 'package:permission_handler/permission_handler.dart';

class CheckLocationPermissionScreen extends StatelessWidget {
  const CheckLocationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: GColors.CRYPTOLAB_PURPLE,
          title: const Text('권한 추가')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: GColors.WHITE,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/hand_icon.png'),
                  const SizedBox(height: 20),
                  const Text(
                    '해당 서비스를 이용하기 위해',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    '위치 권한이 필요해요.',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    '보호자가 움직이는 위치에 맞춰 보호 구역 위치를 변경해야 하기 때문에, 위치 권한이 필요해요.',
                    style: TextStyle(
                      height: 1.3,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '앱을 켜놓지 않아도 안전하게 보호할 수 있게, 위치 권한을 항상으로 바꾸어주세요.',
                    style: TextStyle(
                      height: 1.3,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: GColors.WHITE,
              ),
              child: Column(
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 16,
                        color: GColors.BLACK,
                        height: 1.3,
                      ),
                      children: [
                        TextSpan(text: '· 사용자의 위치 정보는 '),
                        TextSpan(
                          text: '아무도 확인할 수 없게',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: ' 동형암호를 사용해 안전하게 보호하고 있어요.\n'),
                        TextSpan(text: '\n', style: TextStyle(fontSize: 10)),
                        TextSpan(
                          text: '· 디지털 펜스를 벗어난',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: ' 환자분의 위치정보는 보호자분에게만 로그로 제공되요.\n'),
                        TextSpan(text: '\n', style: TextStyle(fontSize: 10)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            InkWell(
              onTap: () {
                openAppSettings();
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 0.1),
                  color: GColors.PERIWINKLE,
                ),
                child: const Center(
                  child: Text('설정 화면 이동하기'),
                ),
              ),
            ),
            const SizedBox(height: 15),
            InkWell(
              onTap: () async {
                if (await Permission.locationAlways.isGranted) {
                  Navigator.of(MyApp.navigatorKey.currentContext!)
                      .pushNamed(Routes.MAIN);
                } else {
                  ScaffoldMessenger.of(MyApp.navigatorKey.currentContext!)
                      .showSnackBar(
                    const SnackBar(
                      content: Text('위치 권한을 \'항상\'으로 바꾸어 주세요.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.1,
                  ),
                  color: GColors.CRYPTOLAB_PURPLE,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    '다음',
                    style: TextStyle(color: GColors.WHITE, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
