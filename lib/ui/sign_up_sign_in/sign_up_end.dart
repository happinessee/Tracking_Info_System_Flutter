import 'package:flutter/material.dart';

import 'package:capstone/consts/colors.dart';
import 'package:capstone/consts/routes.dart';

class SignUpEnd extends StatelessWidget {
  const SignUpEnd({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            const Text(
              '회원가입이 완료되었어요!',
              style: TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 40),
            const Text(
              '컨테이너 실시간 추적 관리 시스템\n'
              '사용자의 운송 위치를 기록해 관리자와의 소통 부담을 덜어주고\n'
              '데이터를 이용해 빠른 길 안내 기능을 제공해요.',
              style: TextStyle(
                fontSize: 15,
                height: 1.2,
              ),
            ),
            const Expanded(child: SizedBox()),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(Routes.MAIN, (route) => false);
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: GColors.CRYPTOLAB_PURPLE,
                ),
                child: const Center(
                  child: Text(
                    '시작하기',
                    style: TextStyle(
                      color: GColors.WHITE,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
