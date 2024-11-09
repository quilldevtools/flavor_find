import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

Future main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flavor Find',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.amber,
        scaffoldBackgroundColor: Colors.white,
        canvasColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
