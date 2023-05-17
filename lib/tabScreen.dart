import 'package:electricsapp/screens/Explore.dart';
import 'package:electricsapp/screens/card.dart';
import 'package:electricsapp/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List _LISTIMG=[
    'lib/images/cart/Image.png',
    'lib/images/cart/Image1.png',
    'lib/images/cart/Image2.png',
    'lib/images/cart/Image3.png',
    'lib/images/cart/Image4.png',
  ];
  int selectedIndex = 0;
  onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  List<Map<String,dynamic>> tabpages=[
    {'page':const Explore()},
    {'page': CARD(img: "lib/images/cart/Image.png",)},
    {'page':const Profile()},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabpages[selectedIndex]['page'],
      bottomNavigationBar:SlidingClippedNavBar(
        backgroundColor: Colors.white,
        onButtonPressed: onButtonPressed,
        iconSize: 30,
        activeColor: const Color(0xFF01579B),
        selectedIndex: selectedIndex,
        barItems: <BarItem>[
          BarItem(
            icon: Icons.ads_click_outlined,
            title: 'Explore',
          ),
          BarItem(
            icon: Icons.shopping_cart,
            title: 'Cart',
          ),
          BarItem(
            icon: Icons.person_outline,
            title: 'Profile',
          ),
        ],
      ),
    );
  }
}
