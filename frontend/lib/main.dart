import 'package:frontend/screens/auth/welcome_screen.dart';
import 'package:frontend/screens/config.dart';
import 'package:frontend/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/profile/user_profile.dart';

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
          surface: Colors.white,
          onSurface: Colors.black,
          primary: Color.fromARGB(255, 230, 97, 20),
          onPrimary: Colors.black,
          secondary: Color.fromARGB(255, 42, 101, 173),
          onSecondary: Colors.white,
          tertiary: Color.fromARGB(255, 255, 167, 66),
          error: Colors.red,
          outline: Color(0xFF424242)
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/home': (context) => const HomePage(),
        // '/config': (context) => const ConfigPage(),
        '/user': (context) => const UserProfile(),
      }
    );
  }
}