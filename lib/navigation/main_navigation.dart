import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/Main page/home_screen.dart';
import '../utils/screen_size_extension.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        elevation: 0.0,
        fixedColor: Colors.black,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        items: [
          const BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.home,
              size: 22.0,
            ),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: SvgPicture.asset(
              "assets/icons/chat_icon.svg",
              width: context.widthPercent(22.0),
              height: context.heightPercent(22.0),
            ),
            label: 'Сообщения',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: SvgPicture.asset(
              "assets/icons/service_icon.svg",
              width: context.widthPercent(22.0),
              height: context.heightPercent(22.0),
            ),
            label: 'Услуги',
          ),
          const BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.person,
              size: 22.0,
            ),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
