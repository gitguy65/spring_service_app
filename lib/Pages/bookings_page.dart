import 'package:flutter/material.dart';
import 'package:spring_service/Pages/nestedPages/create_booking.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text('Bookings'),
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
    );
  }
}
