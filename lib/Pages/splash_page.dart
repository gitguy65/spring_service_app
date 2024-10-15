import 'dart:async';
import 'package:flutter/material.dart';
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
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SizedBox(
          width: 90,
          height: 90,
          child: Image.asset('assets/images/preview.jpg'),
        ),
      ),
    );
  }
}
