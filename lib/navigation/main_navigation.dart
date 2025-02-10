import 'package:flutter/material.dart';
import 'package:handy_man/providers/bottom_bar_index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/Main page/home_screen.dart';
import '../screens/Main page/service_screen.dart';
import '../screens/Main page/profile_screen.dart';
import '../screens/Main page/user_orders.dart';
import '../../models/bottom_nav_item_data.dart';
import './components/custom_navigation_bar.dart';
import 'package:provider/provider.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  final List<Widget Function()> _screensBuilders = [
    () => HomeScreen(),
    () => UserOrders(),
    () => ServiceScreen(),
    () => const ProfileScreen(),
  ];

  Future<bool> onWillPop() async {
    int currentIndex = context.read<BottomBarIndex>().index;
    if (currentIndex > 0) {
      context.read<BottomBarIndex>().changeBarIndex(newIndex: 0);
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = context.watch<BottomBarIndex>().index;
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: currentIndex,
          children: _screensBuilders.map((builder) => builder()).toList(),
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: currentIndex,
          items: [
            BottomNavItemData(icon: Icons.home, label: 'Главная'),
            BottomNavItemData(icon: Icons.message, label: 'Мои заказы'),
            BottomNavItemData(icon: Icons.build, label: 'Услуги'),
            BottomNavItemData(icon: Icons.person, label: 'Профиль'),
          ],
          onItemSelected: (newIndex) {
            context.read<BottomBarIndex>().changeBarIndex(newIndex: newIndex);
          },
        ),
      ),
    );
  }
}
