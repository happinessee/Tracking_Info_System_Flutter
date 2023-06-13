import 'package:flutter/material.dart';

import 'package:capstone/main.dart';
import 'package:capstone/consts/colors.dart';
import 'package:capstone/consts/routes.dart';
import 'package:capstone/consts/storage_key.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SelectTeam extends StatelessWidget {
  const SelectTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GColors.WHITE,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: const Text(
          '소속을 선택해주세요.',
          style: TextStyle(color: GColors.BLACK),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: InkWell(
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setInt(StorageKey.IS_MANAGER, 1);
                  Navigator.of(MyApp.navigatorKey.currentContext!)
                      .pushNamed(Routes.DRIVER_SIGN_UP);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.2),
                    borderRadius: BorderRadius.circular(15),
                    color: GColors.WHITE,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(text: '나는 '),
                              TextSpan(
                                text: '화물 운송자',
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                              TextSpan(text: ' 입니다.')
                            ],
                            style: TextStyle(
                              color: GColors.BLACK,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '화물 이동경로 확인 서비스,\n'
                          '이동경로 추천 서비스 등을 받을 수 있어요.',
                          style: TextStyle(height: 1.5),
                        ),
                        const Expanded(child: SizedBox()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              'assets/images/watering-can.png',
                              width: 140,
                              height: 140,
                            ),
                            const SizedBox(width: 15),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: InkWell(
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setInt(StorageKey.IS_MANAGER, 0);
                  Navigator.of(MyApp.navigatorKey.currentContext!)
                      .pushNamed(Routes.MANAGER_SIGN_UP);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.2),
                    borderRadius: BorderRadius.circular(15),
                    color: GColors.WHITE,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(text: '나는 '),
                              TextSpan(
                                text: '운송 관리자',
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                              TextSpan(text: ' 입니다.')
                            ],
                            style: TextStyle(
                              color: GColors.BLACK,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '운송 진행사항을 확인할 수 있어요.\n'
                          '웹 브라우저로도 확인 가능해요.',
                          style: TextStyle(height: 1.5),
                        ),
                        const Expanded(child: SizedBox()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              'assets/images/sprout_icon.png',
                              width: 150,
                              height: 150,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
