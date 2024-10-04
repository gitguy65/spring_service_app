import 'package:flutter/material.dart';
import 'package:spring_service/Pages/nestedPages/create_booking.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spring Service'),
        automaticallyImplyLeading: false,
      ),
      body: const Text('Bookings'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return const CreateBooking();
          }));
        },
      ),
    );
  }
}
