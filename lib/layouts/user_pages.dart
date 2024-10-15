import 'package:flutter/material.dart';
import 'package:spring_service/pages/components/user_avatar.dart';
import 'package:spring_service/pages/bookings_page.dart';
import 'package:spring_service/pages/chat_page.dart';
import 'package:spring_service/pages/home_page.dart';
import 'package:spring_service/pages/profile_page.dart';
import 'package:spring_service/pages/settings_page.dart';

class UserPages extends StatefulWidget {
  const UserPages({super.key});

  @override
  State<UserPages> createState() => _UserPagesState();
}

class _UserPagesState extends State<UserPages> {
  int currentPage = 0;
  String userName = 'Tega';
  String myAvatar = 'https://randomuser.me/api/portraits/med/women/5.jpg';

  // Home page requirements
  final List topStaff = [
    [
      'https://randomuser.me/api/portraits/med/women/5.jpg',
      'Black Verawang',
      'Cleaner',
      4.8,
      20.00
    ],
    [
      'https://randomuser.me/api/portraits/med/men/4.jpg',
      'Mike Peller',
      'HandyMan',
      4.6,
      24.00
    ],
    [
      'https://randomuser.me/api/portraits/med/women/25.jpg',
      'Amber Hedge',
      'Cleaner',
      4.1,
      20.00
    ],
  ];

  final List serviceCategories = [
    ['https://randomuser.me/api/portraits/med/men/5.jpg', 'Plumbing'],
    ['https://randomuser.me/api/portraits/med/women/75.jpg', 'Laundry'],
    ['https://randomuser.me/api/portraits/med/women/8.jpg', 'Handyman'],
    ['https://randomuser.me/api/portraits/med/men/75.jpg', 'Gardening'],
    ['https://randomuser.me/api/portraits/med/men/4.jpg', 'Gardening'],
    ['https://randomuser.me/api/portraits/med/women/75.jpg', 'Gardening'],
  ];

  final categories = <String>[
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Grapes',
    'Orange',
    'Peach',
    'Watermelon',
  ];

  // bookings page requirement
  final List bookings = const [];

  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    pages = [
      HomePage(),
      BookingsPage(),
      const ChatPage(),
      const SettingsPage()
    ];
  }

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
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
              size: 18,
            ),
            offset: const Offset(0, 50),
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text(
                  'Item 1',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const PopupMenuItem(
                child: Text(
                  'Item 2',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const PopupMenuItem(
                child: Text(
                  'Item 3',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const PopupMenuItem(
                child: Text(
                  'Item 4',
                  style: TextStyle(fontSize: 14),
                ),
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
        fixedColor: Theme.of(context).colorScheme.primary,
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
