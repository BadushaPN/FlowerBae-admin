import 'package:admin/utils/color.dart';
import 'package:admin/view/home_page/home_page_sceen.dart';
import 'package:admin/view/new_orders_screen/new_orders_screen.dart';
import 'package:admin/view/orders/orders.dart';
import 'package:admin/view/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigatoionBar extends StatefulWidget {
  const BottomNavigatoionBar({super.key});

  @override
  State<BottomNavigatoionBar> createState() => _BottomNavigatoionBarState();
}

class _BottomNavigatoionBarState extends State<BottomNavigatoionBar> {
  @override
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    HomePag(),
    NewOrdersScreen(),
    Orders(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: dark, borderRadius: BorderRadius.circular(60)),
          child: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: _onItemTapped,
            tabs: const [
              GButton(
                icon: Icons.home,
                iconColor: light,
                text: 'Home',
              ),
              GButton(
                icon: Icons.category_rounded,
                text: 'Catalog',
                iconColor: light,
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Whishlist',
                iconColor: light,
              ),
              GButton(
                icon: Icons.shopping_cart,
                text: 'Cart',
                iconColor: light,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
