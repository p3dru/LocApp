import 'package:flutter/material.dart';
import 'package:frontend/widgets/bottom.navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Bem-Vindo ao LocApp',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Text('HomePage'),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}