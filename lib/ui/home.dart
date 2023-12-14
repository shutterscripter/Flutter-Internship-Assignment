import 'package:employee_login/components/page01.dart';
import 'package:employee_login/components/page02.dart';
import 'package:employee_login/components/page03.dart';
import 'package:employee_login/components/page04.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              )),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: GNav(
              gap: 8,
              duration: const Duration(milliseconds: 300),
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              backgroundColor: Colors.black,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.orangeAccent,
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              tabs: const [
                GButton(
                  icon: Icons.home_filled,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.add,
                  text: 'Add',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                ),
                GButton(
                  icon: Icons.info,
                  text: 'Info',
                ),
              ],
            ),
          ),
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: const [
            AllEmployee(),
            Page2(),
            Page3(),
            Page04(),
          ],
        ));
  }
}
