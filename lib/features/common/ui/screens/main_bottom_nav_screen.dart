import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lipika/application/app_colors.dart';
import 'package:lipika/features/library/ui/screens/my_library.dart';
import 'package:lipika/features/my_books/ui/screen/my_books.dart';
import 'package:lipika/features/profile/ui/screens/profile.dart';
import 'package:provider/provider.dart';

import '../../../../application/assets_path.dart';
import '../../../home/ui/screens/home_screen.dart';
import '../controller/main_bottom_nav_provider.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    MyBooks(),
    MyLibrary(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainBottomNavProvider>(
      builder: (context, provider, child)=>Scaffold(
            body: _screens[provider.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: provider.selectedIndex,
              onTap: provider.changeIndex,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsPath.home,
                    width: 20, height: 20,
                    colorFilter: const ColorFilter.mode(
                      Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                  activeIcon: SvgPicture.asset(
                    AssetsPath.home,
                    width: 20, height: 20,
                    colorFilter: const ColorFilter.mode(
                      AppColors.themeColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsPath.books,
                    width: 20, height: 20,
                    colorFilter: const ColorFilter.mode(
                      Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                  activeIcon: SvgPicture.asset(
                    AssetsPath.myBooksActive,
                    width: 20, height: 20,
                    colorFilter: const ColorFilter.mode(
                      AppColors.themeColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: "My Books",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsPath.library,
                    width: 20, height: 20,
                    colorFilter: const ColorFilter.mode(
                      Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                  activeIcon: SvgPicture.asset(
                    AssetsPath.library,
                    width: 20, height: 20,
                    colorFilter: const ColorFilter.mode(
                      AppColors.themeColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: "Library",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsPath.profile,
                    width: 20, height: 20,
                    colorFilter: const ColorFilter.mode(
                      Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                  activeIcon: SvgPicture.asset(
                    AssetsPath.profile,
                    width: 20, height: 20,
                    colorFilter: const ColorFilter.mode(
                      AppColors.themeColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: "Profile",
                ),
              ],
              selectedItemColor: AppColors.themeColor,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
            ),
          ),
    );

  }
}
