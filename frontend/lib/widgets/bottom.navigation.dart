import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index){
        switch(index){
          case 0:
            Navigator.pushNamed(context, "/");
            break;
          case 1:
            Navigator.pushNamed(context, "/pedidos");
            break;
          case 2:
            Navigator.pushNamed(context, "/user");
            break;
         
        };
      },
      type: BottomNavigationBarType.shifting,
      elevation: 0,
      mouseCursor: SystemMouseCursors.grab,
      selectedFontSize: 13,
      selectedIconTheme: IconThemeData(
      color: Theme.of(context).colorScheme.primary, 
      size: 20,
      ),
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Descubra"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: "Meus pedidos"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Minha conta"
        ),
      ],
    );
  }
}