import 'package:flutter/material.dart';
import 'package:spring_service/presentation/components/category_tile.dart';
import 'package:spring_service/presentation/components/staff_tile.dart';
import 'package:spring_service/presentation/models/category_model.dart';
import 'package:spring_service/presentation/models/staff_model.dart';
import 'package:spring_service/presentation/nestedPages/create_booking.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

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

  final List serviceCategory = [
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
    'Watermelon'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        mini: true,
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return const CreateBooking();
          }));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),

            // search box
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return categories.where((String option) {
                    return option
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase());
                  }).toList();
                },
                onSelected: (selected) {},
                fieldViewBuilder: (BuildContext context,
                    TextEditingController textEditingController,
                    FocusNode focusNode,
                    VoidCallback onFieldSubmitted) {
                  return TextField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    style: const TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 2.0,
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 2.0,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      labelText: 'Search for a service',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                    ),
                    onSubmitted: (String value) {
                      onFieldSubmitted();
                    },
                  );
                },
                optionsViewBuilder: (BuildContext context,
                    AutocompleteOnSelected<String> onSelected,
                    Iterable<String> options) {
                  final width = MediaQuery.of(context).size.width - 20;
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: width,
                      constraints: const BoxConstraints(
                        maxHeight: 200,
                      ),
                      child: Material(
                        elevation: 4.0,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: options.length,
                          itemBuilder: (BuildContext context, int index) {
                            final String option = options.elementAt(index);
                            return ListTile(
                              title: Text(
                                option,
                                style: const TextStyle(fontSize: 16),
                              ),
                              onTap: () {
                                onSelected(option);
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // welcome image
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              height: 150,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/clean.jpeg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        padding: const EdgeInsets.all(8),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Get\nDiscount\nUp to ',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
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
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: serviceCategory.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: CategoryTile(
                      categoryModel: CategoryModel(
                        categoryImageUrl: serviceCategory[index][0],
                        categoryImageRadius: 22,
                        categoryName: serviceCategory[index][1],
                      ),
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
                          staffModel: StaffModel(
                            circleAvatarUrl: topStaff[index][0],
                            name: topStaff[index][1],
                            service: topStaff[index][2],
                            rating: topStaff[index][3],
                            charge: topStaff[index][4],
                          ),
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
