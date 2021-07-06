import 'package:flutter/material.dart';
import 'package:game_app/screens/user/home/home.dart';
import 'package:game_app/screens/user/home/profile.dart';

class BottomBar extends StatefulWidget {

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedPageIndex = 0;
  List<Map<String, Widget>> _pages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages =[
      { "page": HomeScreen()},
      { "page": ProfileScreen()}
    ];
  }

  _selectPage(int i) {
    setState(() {
      _selectedPageIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: _pages[_selectedPageIndex]["page"],
       bottomNavigationBar: BottomNavigationBar(
         items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
         ],
         currentIndex: _selectedPageIndex,
         selectedItemColor: Colors.purple,
         unselectedItemColor: Colors.grey,
         onTap: _selectPage,
       ),
    );
  }
}