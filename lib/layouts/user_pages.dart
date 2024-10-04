import 'package:flutter/material.dart';
import 'package:spring_service/Pages/bookings_page.dart';
import 'package:spring_service/Pages/chat_page.dart';
import 'package:spring_service/Pages/home_page.dart';
import 'package:spring_service/Pages/settings_page.dart';

class UserPages extends StatefulWidget {
  const UserPages({super.key});

  @override
  State<UserPages> createState() => _UserPagesState();
}

class _UserPagesState extends State<UserPages> {
  int currentPage = 0;

  List<Widget> pages = const [
    HomePage(),
    BookingsPage(),
    ChatPage(),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
        currentIndex: currentPage,
        onTap: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
