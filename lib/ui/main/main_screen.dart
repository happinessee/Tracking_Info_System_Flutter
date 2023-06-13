import 'package:flutter/material.dart';

import 'package:capstone/consts/colors.dart';
import 'package:capstone/ui/home/home.dart';
import 'package:capstone/ui/settings/setting_screen.dart';
import 'package:capstone/ui/users/user.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 60,
        backgroundColor: GColors.WHITE,
        destinations: const [
          NavigationDestination(
            icon:
                Icon(Icons.settings_outlined, color: GColors.CRYPTOLAB_PURPLE),
            selectedIcon: Icon(Icons.settings, color: GColors.CRYPTOLAB_PURPLE),
            label: '설정',
          ),
          NavigationDestination(
            icon: Icon(Icons.home_outlined, color: GColors.CRYPTOLAB_PURPLE),
            selectedIcon: Icon(Icons.home, color: GColors.CRYPTOLAB_PURPLE),
            label: '홈',
          ),
          NavigationDestination(
              icon: Icon(Icons.grid_view_outlined,
                  color: GColors.CRYPTOLAB_PURPLE),
              selectedIcon:
                  Icon(Icons.grid_view, color: GColors.CRYPTOLAB_PURPLE),
              label: '사용자 설정'),
        ],
        onDestinationSelected: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        selectedIndex: _currentIndex,
      ),
      body: [const Setting(), Home(), const User()][_currentIndex],
    );
  }
}
