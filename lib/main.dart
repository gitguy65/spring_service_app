import 'package:flutter/material.dart';
import 'package:spring_service/Pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Spring Service',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Poppins',
          primarySwatch: Colors.blue,
          primaryColor: Color(0xff17376B),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xff17376B),
            primary: Color(0xff17376B),
            secondary: Colors.orange,
          ),
          textTheme: TextTheme(
            bodyLarge: TextStyle(fontSize: 16.0),
            bodyMedium: TextStyle(fontSize: 14.0),
            bodySmall: TextStyle(fontSize: 12.0),
            titleLarge: TextStyle(fontSize: 18.0),
          )),
      home: const SplashPage(),
    );
  }
}
