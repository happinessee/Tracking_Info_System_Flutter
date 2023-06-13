import 'package:flutter/material.dart';

import 'package:capstone/consts/routes.dart';
import 'package:capstone/consts/colors.dart';

class Initial extends StatelessWidget {
  const Initial({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox()),
          const Text(
            '컨테이너 추적 관리 시스템',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '컨테이너 실시간 추적 관리 시스템\n운전자가 편하게 운송을 관리할 수 있도록.',
            style: TextStyle(
              height: 1.2,
              fontSize: 15,
            ),
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(Routes.SELECT_TEAM);
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
                    '시작하기',
                    style: TextStyle(color: GColors.WHITE, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('이미 계정이 있나요?', style: TextStyle(color: GColors.GREY)),
              TextButton(
                child: const Text('로그인',
                    style: TextStyle(color: GColors.CRYPTOLAB_PURPLE)),
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.SIGN_IN);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
