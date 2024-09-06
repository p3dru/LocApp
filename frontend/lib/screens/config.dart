import 'package:flutter/material.dart';
import 'package:frontend/widgets/bottom.navigation.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Configurações',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: const SingleChildScrollView(
        child: Text('ConfigPage'),
      ),
     /* bottomNavigationBar: const BottomNavigation(),*/
    );
  }
}