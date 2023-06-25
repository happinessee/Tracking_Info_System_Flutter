import 'package:flutter/material.dart';

import 'package:capstone/consts/colors.dart';
import 'package:capstone/consts/routes.dart';

class User extends StatelessWidget {
  const User({super.key});

  static const List<String> _settingList = [
    '공지사항',
    '환경설정',
    '운송 내역',
    '일정 관리',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('사용자 설정'),
        centerTitle: true,
        backgroundColor: GColors.CRYPTOLAB_PURPLE,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(top: 10),
        itemCount: _settingList.length + 1,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          if (index == _settingList.length) {
            return Container();
          } else {
            return _contentFunc(index, context);
          }
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(color: GColors.FONTGRAY),
      ),
    );
  }

  Widget _contentFunc(int index, BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: GColors.TRANSPARENT,
      highlightColor: GColors.TRANSPARENT,
      splashColor: GColors.TRANSPARENT,
      child: Container(
        padding: const EdgeInsets.fromLTRB(30, 10, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _settingList[index],
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: GColors.FONTGRAY),
          ],
        ),
      ),
    );
  }
}
