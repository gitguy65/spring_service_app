import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final List serviceCategory = [
    ['https://randomuser.me/api/portraits/med/men/5.jpg', 'Plumbing'],
    ['https://randomuser.me/api/portraits/med/women/75.jpg', 'Laundry'],
    ['https://randomuser.me/api/portraits/med/women/75.jpg', 'Handyman'],
    ['https://randomuser.me/api/portraits/med/men/75.jpg', 'Gardening'],
    ['https://randomuser.me/api/portraits/med/men/75.jpg', 'Gardening'],
    ['https://randomuser.me/api/portraits/med/women/75.jpg', 'Gardening'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'My Profile',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
      body: SizedBox(
        height: 100,
        width: double.infinity, // <-- HERE
        child: Scrollbar(
          // Added a scrollbar
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 100,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: 40,
                  width: 40,
                  color: Colors.red,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
