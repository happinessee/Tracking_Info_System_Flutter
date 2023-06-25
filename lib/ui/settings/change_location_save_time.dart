import 'package:capstone/consts/colors.dart';
import 'package:capstone/ui/settings/menu_option_quantity_button.dart';
import 'package:flutter/material.dart';

class ChangeLocationSaveTime extends StatelessWidget {
  const ChangeLocationSaveTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('위치 기록 주기 변경'),
        backgroundColor: GColors.CRYPTOLAB_PURPLE,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            MenuOptionQuantityButton(
                plusOnPressed: () {}, minusOnPressed: () {}),
            const SizedBox(height: 20),
            const Text(
              '변경 주기를 선택해주세요.',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 3),
            const Text('    주기가 빠를수록 정확도가 올라갑니다.\n주기가 낮을수록 배터리 효율이 올라갑니다.'),
          ],
        ),
      ),
    );
  }
}
