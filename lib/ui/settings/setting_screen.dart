import 'package:flutter/material.dart';

import 'package:capstone/main.dart';

import 'package:capstone/consts/colors.dart';
import 'package:capstone/consts/routes.dart';

import 'package:daum_postcode_search/daum_postcode_search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: GColors.CRYPTOLAB_PURPLE,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(Routes.CHANGE_LOCATION_SAVE_TIME);
                },
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.2),
                    borderRadius: BorderRadius.circular(15),
                    color: GColors.PISTACHIO_LIGHT,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '위치 기록 주기 변경',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '위치기록 주기를 변경할 수 있어요.\n'
                          '위치기록 주기를 변경하면 배터리를 아낄 수 있지만,\n'
                          '약간의 정확도가 떨어질 수 있어요.',
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
      ),
    );
  }
}
