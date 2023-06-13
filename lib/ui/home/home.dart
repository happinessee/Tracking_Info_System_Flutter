import 'package:capstone/consts/routes.dart';
import 'package:flutter/material.dart';

import 'package:capstone/main.dart';
import 'package:capstone/consts/default.dart';
import 'package:capstone/consts/colors.dart';
import 'package:capstone/consts/storage_key.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatelessWidget {
  Home({super.key});
  static WebViewController? mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          '컨테이너 실시간 추적 관리 시스템',
          style: TextStyle(
            color: GColors.CRYPTOLAB_PURPLE,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add_box_outlined,
              color: GColors.GREY,
              size: 28,
            ),
            onPressed: () {},
          )
        ],
        backgroundColor: GColors.WHITE,
      ),
      body: FutureBuilder(
        future: tmp(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    child: InkWell(
                      onTap: () {},
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
                                '이동 경로 검색',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '실시간 교통 상황을 확인하며 원하는 목적지에,\n'
                                '사용자님의 이동정보는 빠른 길 추천에 이용됩니다.',
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.2),
                          borderRadius: BorderRadius.circular(15),
                          color: GColors.CRYPTOLAB_PURPLE,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '빠른 길 추천',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: GColors.WHITE,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '다른 사용자와 비교해 실제로 빠른 경로와 운송 시간을 확인해요. '
                                '개인 정보는 철저하게 보호됩니다.',
                                style: TextStyle(
                                  color: GColors.WHITE,
                                  height: 1.2,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.2),
                          borderRadius: BorderRadius.circular(15),
                          color: GColors.PERIWINKLE,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '화물 이동경로 확인',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '사용자님의 이동 경로를 확인할 수 있어요.\n'
                                '날짜별로 언제 이동했고 언제 휴식을 취했는지 확인하세요.',
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
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<bool> tmp() async {
    return true;
  }
}
