import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:dokan/core/const/asset_const.dart';
import 'package:dokan/core/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../product_list/product_list_page.dart';
import '../profile/profile_page.dart';
import '../unimplemented/unimplemented_page.dart';

class HomeLayoutPage extends HookWidget {
  const HomeLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);
    final pageController = usePageController();

    final List pages = [
      const ProductListPage(),
      const Unimplemented(),
      const Unimplemented(),
      const ProfilePage(),
    ];

    final List<String> iconPathList = [
      AssetConst.homeIcon,
      AssetConst.dashbaordIcon,
      AssetConst.cartIcon,
      AssetConst.userSIcon,
    ];
    Widget getIcon(
      int index,
      bool isActive,
    ) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Image.asset(
          iconPathList[index],
          height: 16,
          width: 16,
          color: isActive ? Palette.primaryColor : Palette.lightFontColor,
        ),
      );
    }

    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ), //destination screen
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: Colors.white, // Make the background transparent
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: Palette.reversePrimaryGradient,
          ),
          child: const Icon(
            Icons.search,
            color: Palette.onPrimaryColor,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        height: kBottomNavigationBarHeight + 16,
        itemCount: iconPathList.length,
        tabBuilder: (int index, bool isActive) {
          return getIcon(index, isActive);
        },
        activeIndex: selectedIndex.value,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 16,
        rightCornerRadius: 16,
        onTap: (index) {
          selectedIndex.value = index;

          /// `animateToPage` traverses all the pages in between the current page and the destination page
          /// for this behavior when the user taps on the home to profile, it travels dashboard and cart page too
          /// which is not the desired behavior
          /// we use `jumpToPage` to directly jump to the destination page
          /// only downside is that it doesn't have any animation
          /// for now we are using `animateToPage` for the animation and ignoring performance part

          pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300), curve: Curves.fastLinearToSlowEaseIn);
        },
      ),
    );
  }
}
