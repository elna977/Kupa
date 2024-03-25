import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kupa/Screens/cart.dart';
import 'package:kupa/Screens/homeScreen.dart';
import 'package:kupa/Screens/menuScreen.dart';
import 'package:kupa/Screens/profileScreen.dart';
import 'package:kupa/themes/AppColor.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class Navi extends StatefulWidget {
  const Navi({super.key});

  @override
  State<Navi> createState() => _NaviState();
}

class _NaviState extends State<Navi> {
  dynamic selected;
  var heart = false;
  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, //to make floating action button notch transparent

      //to avoid the floating action button overlapping behavior,
      // when a soft keyboard is displayed
      // resizeToAvoidBottomInset: false,

      bottomNavigationBar: StylishBottomBar(
        option: AnimatedBarOptions(
          // iconSize: 32,
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.animated,
          // opacity: 0.3,
        ),
        items: [
          BottomBarItem(
            icon: const Icon(
              Icons.house_outlined,
            ),
            selectedIcon: const Icon(Icons.house_rounded),
            // selectedColor: Colors.teal,
            backgroundColor: AppColors.thirdColor,
            title: const Text('Home'),

          ),
          BottomBarItem(
            icon: const Icon(Icons.description_outlined),
            selectedIcon: const Icon(Icons.description,),
            selectedColor: AppColors.thirdColor,
            // unSelectedColor: Colors.purple,
            // backgroundColor: Colors.orange,
            title: const Text('Menu'),
          ),
          BottomBarItem(
              icon: const Icon(
                Icons.shopping_cart_outlined,
              ),
              selectedIcon: const Icon(
                Icons.shopping_cart,
              ),
              selectedColor: AppColors.thirdColor,
              title: const Text('Cart')),
          BottomBarItem(
              icon: const Icon(
                Icons.person_outline,
              ),
              selectedIcon: const Icon(
                Icons.person,
              ),
              selectedColor: AppColors.thirdColor,
              title: const Text('Profile')),
        ],
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
        currentIndex: selected ?? 0,
        onTap: (index) {
          controller.jumpToPage(index);
          setState(() {
            selected = index;
          });
        },
      ),
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: const [
            HomeScreen(),
            MenuScreen(),
            CartScreen(),
            ProfileScreen()
          ],
        ),
      ),
    );
  }
}
