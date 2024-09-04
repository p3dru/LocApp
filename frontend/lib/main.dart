import 'package:frontend/screens/auth/welcome_screen.dart';
import 'package:frontend/screens/config.dart';
import 'package:frontend/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Locapp',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          background: Colors.white,
          onBackground: Colors.black,
          primary: Color.fromARGB(255, 251, 117, 22),
          onPrimary: Colors.black,
          secondary: Color.fromARGB(255, 52, 152, 219),
          onSecondary: Colors.white,
          tertiary: Color.fromARGB(255, 250, 156, 22),
          error: Colors.red,
          outline: Color(0xFF424242)
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/home': (context) => HomePage(),
        '/config': (context) => ConfigPage(),
      }
    );
  }
}