import 'dart:async';
import 'package:flutter/material.dart';
import 'package:spring_service/Pages/home_page.dart';
import 'package:spring_service/layouts/user_pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) {
          return const UserPages();
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff17376B),
      body: Center(
        child: SizedBox(
          width: 90, // Set the desired width
          height: 90, // Set the desired height
          child: Image.asset('assets/preview.jpg'),
        ),
      ),
    );
  }
}
