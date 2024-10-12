import 'package:flutter/material.dart';
import 'package:spring_service/Pages/components/service_tile.dart';
import 'package:spring_service/Pages/nestedPages/create_booking.dart';
import 'package:spring_service/Pages/components/staff_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List topStaff = [
    ['avatar', 'Black Verawang', 'Cleaner', 4.8, 20.00],
    ['avatar', 'Mike Peller', 'HandyMan', 4.6, 24.00],
    ['avatar', 'Amber Hedge', 'Cleaner', 4.1, 20.00],
  ];

  final List serviceCategory = [
    ['avatar', 'Plumbing'],
    ['avatar', 'Laundry'],
    ['avatar', 'Handyman'],
    ['avatar', 'Gardening'],
    ['avatar', 'Gardening'],
    ['avatar', 'Gardening'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        mini: true,
        shape: const CircleBorder(),
        backgroundColor: const Color(0xff17376B),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return const CreateBooking();
          }));
        },
        child: const Icon(
          Icons.add,
          color: Color(0xffffffff),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // welcome image
            Container(
              margin: const EdgeInsets.all(10),
              height: 150,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/clean.jpeg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        padding: const EdgeInsets.all(8),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Get\nDiscount\nUp to ',
                                style: TextStyle(
                                  color: const Color(0xff17376B),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      offset: const Offset(1.5, 1.5),
                                      blurRadius: 3.0,
                                      color: Colors.black.withOpacity(0.1),
                                    ),
                                  ],
                                ),
                              ),
                              TextSpan(
                                text: '20%',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      offset: const Offset(1.5, 1.5),
                                      blurRadius: 3.0,
                                      color: Colors.black.withOpacity(0.1),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // service category
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Text(
                'Service Category',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            SizedBox(
              height: 100,
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

            const SizedBox(
              height: 20,
            ),

            // recommended service
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Text(
                'Recommended Services',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: topStaff.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: StaffTile(
                          circleAvatarUrl: topStaff[index][0],
                          name: topStaff[index][1],
                          service: topStaff[index][2],
                          rating: topStaff[index][3],
                          charge: topStaff[index][4],
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
