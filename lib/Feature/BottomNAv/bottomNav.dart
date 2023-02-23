import 'package:Ninja/Feature/Profile/profile.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../../../Core/Helper/Color.dart';
import '../Favourite/favourite.dart';
import '../Landing_Screen/Landing.dart';
import '../MainScreen/MianScreen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  int maxCount = 4;

  /// widget list
  final List<Widget> bottomBarPages = [
    const MainScreen(),
    FavouritePage(),
    LandingScreen(),
    Profile()
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  AppColor appColor = AppColor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              pageController: _pageController,
              color: appColor.white,
              showLabel: false,
              notchColor: appColor.mainColor,
              bottomBarItems: [
                ///svg example
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.store_outlined,
                    color: Colors.grey,
                  ),
                  activeItem: Icon(Icons.store,
                      color: Color.fromARGB(230, 248, 250, 250)),
                  itemLabel: 'Page 1',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                  ),
                  activeItem: Icon(Icons.favorite,
                      color: Color.fromARGB(230, 248, 250, 250)),
                  itemLabel: 'Page 2',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.notification_add_outlined,
                    color: Colors.grey,
                  ),
                  activeItem: Icon(Icons.notification_add,
                      color: Color.fromARGB(230, 248, 250, 250)),
                  itemLabel: 'Page 3',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  activeItem: Icon(Icons.person_add_alt_outlined,
                      color: Color.fromARGB(230, 248, 250, 250)),
                  itemLabel: 'Page 4',
                ),
              ],
              onTap: (index) {
                /// control your animation using page controller
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
            )
          : null,
    );
  }
}
