import 'package:flutter/material.dart';

import 'package:capstone/consts/colors.dart';
import 'package:capstone/consts/routes.dart';

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('사용자 설정'),
        backgroundColor: GColors.CRYPTOLAB_PURPLE,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 110,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.2),
                  borderRadius: BorderRadius.circular(15),
                  color: GColors.PISTACHIO_LIGHT,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: const [
                      Text(
                        '환자 로그 확인',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '안심 구역을 벗어난 환자분의 동선을 확인하세요.',
                        style: TextStyle(
                          height: 1.2,
                        ),
                      ),
                    ],
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
