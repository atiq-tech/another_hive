import 'package:cart_and_hive/home_page.dart';
import 'package:cart_and_hive/pages/allproduct_page.dart';
import 'package:cart_and_hive/pages/category_page.dart';
import 'package:cart_and_hive/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomNavigationBarPart extends StatefulWidget {
  BottomNavigationBarPart({super.key});

  @override
  State<BottomNavigationBarPart> createState() =>
      _BottomNavigationBarPartState();
}

class _BottomNavigationBarPartState extends State<BottomNavigationBarPart> {
  int _selectedIndex = 0;

  final _ListPages = [
    HomePage(),
    AllProductPage(
      index: 1,
    ),
    CategoryPage(),
    logInPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _ListPages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        fixedColor: Color.fromARGB(255, 3, 107, 46),
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 201, 241, 253),
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits),
            label: "Product",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
        ],
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
