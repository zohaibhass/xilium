import 'package:flutter/material.dart';
import 'features/authentications/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      title: 'xilli',
      theme: ThemeData(
        
        colorScheme:
            ColorScheme.fromSwatch(backgroundColor: const Color(0xff52bf92)),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
