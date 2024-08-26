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
            Navigator.pushNamed(context, "/config");
            break;
        };
      },
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