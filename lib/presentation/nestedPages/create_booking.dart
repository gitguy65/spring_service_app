import 'package:flutter/material.dart';

class CreateBooking extends StatefulWidget {
  const CreateBooking({super.key});

  @override
  State<CreateBooking> createState() => _CreateBookingState();
}

class _CreateBookingState extends State<CreateBooking> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Create Booking',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          padding: EdgeInsets.all(0),
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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              // select cateogry
              // enter description
              // select your location
              // enter offer
              // submit
            ],
          ),
        ),
      ),
    );
  }
}
