import 'package:flutter/material.dart';
import 'package:frontend/screens/home/home.dart';
import 'package:frontend/screens/profile/edit_info/user_edit_info.dart';
import 'package:frontend/screens/profile/user_profile.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart'; 

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _bottomNavIndex = 0;

  // Lista de páginas
  List<Widget> pages = const [
    HomePage(),
    UserProfile(),
  ];

  // Lista de icons das páginas
  List<IconData> iconList = [
    Icons.home,
    Icons.person,
  ];

  // Lista dos títulos das páginas
  List<String> titleList = [
    'Home',
    'Perfil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titleList[_bottomNavIndex], style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),),
            Icon(Icons.notifications, color: Colors.black54, size: 30.0,),
          ],
        ),
        backgroundColor: Colors.white10,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),

      body: IndexedStack(
        index: _bottomNavIndex,
        children: pages,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor:  Theme.of(context).colorScheme.primary.withOpacity(.9),
        activeColor:  Theme.of(context).colorScheme.primary.withOpacity(.9),
        inactiveColor: Colors.black.withOpacity(.5),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index){
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
    );
  }
}