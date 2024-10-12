import 'package:flutter/material.dart';
import 'package:spring_service/Pages/components/user_avatar.dart';
import 'package:spring_service/Pages/bookings_page.dart';
import 'package:spring_service/Pages/chat_page.dart';
import 'package:spring_service/Pages/home_page.dart';
import 'package:spring_service/Pages/profile_page.dart';
import 'package:spring_service/Pages/settings_page.dart';

class UserPages extends StatefulWidget {
  const UserPages({super.key});

  @override
  State<UserPages> createState() => _UserPagesState();
}

class _UserPagesState extends State<UserPages> {
  int currentPage = 0;
  String userName = 'Tega';
  String myAvatar = '';

  List<Widget> pages = [
    HomePage(),
    const BookingsPage(),
    const ChatPage(),
    const SettingsPage()
  ];

  List<Widget> services = const [];
  List<Widget> staff = const [];
  List<Widget> bookings = const [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello $userName',
          style: const TextStyle(
            color: Color(0xffffffff),
            fontSize: 16,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff17376B),
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.notifications,
              color: Color(0xffffffff),
              size: 16,
            ),
            itemBuilder: (context) => const [
              PopupMenuItem(
                child: Text('item 1'),
              ),
              PopupMenuItem(
                child: Text('item 1'),
              ),
              PopupMenuItem(
                child: Text('item 1'),
              ),
              PopupMenuItem(
                child: Text('item 1'),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(0),
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return ProfilePage();
              }));
            },
            child: UserAvatar(
              circleAvatarUrl: myAvatar,
              avatarRadius: 18,
            ),
          ),
        ],
      ),
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: const Color(0xff17376B),
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
