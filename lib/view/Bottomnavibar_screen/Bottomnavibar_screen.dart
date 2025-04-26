import 'package:flutter/material.dart';
import 'package:habbition_test/Utilis/Colorconstant.dart';
import 'package:habbition_test/view/Cart_screen/Cart_screen.dart';
import 'package:habbition_test/view/Category_screen/Category_screen.dart';
import 'package:habbition_test/view/Home_screen/Home_screen.dart';
import 'package:habbition_test/view/Saved_screen/Saved_screen.dart';

class Bottomnavibarscreen extends StatefulWidget {
  const Bottomnavibarscreen({super.key});

  @override
  State<Bottomnavibarscreen> createState() => _BottomnavibarscreenState();
}

class _BottomnavibarscreenState extends State<Bottomnavibarscreen> {
  int selectedtab = 0;
  final List<Widget> screens = [
    Homescreen(),
    CategoryScreen(),
    SavedScreen(),
    CartScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedtab],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            selectedtab = index;
          });
        },
        currentIndex: selectedtab,
        backgroundColor: ColorConstants.maincolor,
        selectedItemColor: ColorConstants.white,
        unselectedItemColor: ColorConstants.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              activeIcon: Image.asset("Assets/Images/Vector.png"),
              icon: Image.asset("Assets/Images/Frame.png"),
              label: "Home"),
          BottomNavigationBarItem(
              activeIcon: Image.asset("Assets/Images/category (2) 1.png"),
              icon: Image.asset("Assets/Images/category (1) 1.png"),
              label: "Category"),
          BottomNavigationBarItem(
              activeIcon: Image.asset("Assets/Images/bookmark (4) 1.png"),
              icon: Image.asset("Assets/Images/bookmark (3) 1.png"),
              label: "Saved"),
          BottomNavigationBarItem(
              activeIcon: Image.asset("Assets/Images/grocery-store 1.png"),
              icon: Image.asset("Assets/Images/shopping-cart 1.png"),
              label: "Cart"),
        ]);
  }
}
