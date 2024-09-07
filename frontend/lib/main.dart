import 'package:frontend/screens/auth/introduction_screen.dart';
import 'package:frontend/screens/auth/welcome_screen.dart';
import 'package:frontend/screens/config.dart';
import 'package:frontend/screens/home/home.dart';
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
          surface: Color.fromARGB(255, 246, 248, 252),
          onSurface: Colors.black,
          primary: Color.fromARGB(255, 89, 131, 230),
          onPrimary: Colors.black,
          secondary: Color.fromARGB(255, 230, 114, 90), 
          onSecondary: Colors.white,
          tertiary: Color.fromARGB(255, 187, 230, 126),
          error: Colors.red,
          outline: Color(0xFF424242)
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const IntroductionScreen(),
        '/home': (context) => const HomePage(),
        // '/config': (context) => const ConfigPage(),
        '/user': (context) => const UserProfile(),
      }
    );
  }
}