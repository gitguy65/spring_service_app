import 'package:flutter/material.dart';
import 'package:spring_service/Pages/components/service_tile.dart';

class ProfilePage extends StatelessWidget {
  final List serviceCategory = [
    ['avatar', 'Plumbing'],
    ['avatar', 'Laundry'],
    ['avatar', 'Handyman'],
    ['avatar', 'Gardening'],
    ['avatar', 'Gardening'],
    ['avatar', 'Gardening'],
  ];

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff17376B),
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
        height: 120, // Increased height to ensure the ListView is visible
        child: Scrollbar(
          // Added a scrollbar
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: serviceCategory.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ServiceTile(
                  categoryImageUrl: serviceCategory[index][0],
                  categoryName: serviceCategory[index][1],
                  categoryImageRadius: 22,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
