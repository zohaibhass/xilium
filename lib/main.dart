import 'package:flutter/material.dart';
import 'auth_screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'xilli',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch(backgroundColor: const Color(0xff52bf92)),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
