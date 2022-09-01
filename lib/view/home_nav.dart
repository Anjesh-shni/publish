import 'package:flutter/material.dart';
import 'package:publish/view/cCartPaage.dart';
import 'package:publish/view/homepage.dart';
import 'package:publish/view/shopping_page.dart';

class MyWidget extends StatefulWidget {
  MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final List<Widget> _screens = [
    ShoppingPage(),
    HomePage(),
    CartPaage(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width >= 640)
            NavigationRail(
                backgroundColor: Colors.grey,
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text("Home"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.person),
                    label: Text("Profiles"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.shopping_cart),
                    label: Text("Cart"),
                  ),
                ],
                selectedIndex: _selectedIndex),
          Expanded(
            child: _screens[_selectedIndex],
          ),
        ],
      ),
      bottomNavigationBar: MediaQuery.of(context).size.width < 640
          ? BottomNavigationBar(
              backgroundColor: Colors.black,
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.grey,
              onTap: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: "Cart",
                )
              ],
            )
          : null,
    );
  }
}
