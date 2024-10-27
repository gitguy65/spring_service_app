import 'package:flutter/material.dart';
import 'package:spring_service/presentation/models/booking_model.dart';
import 'package:spring_service/presentation/components/booking_tile.dart';
import 'package:spring_service/presentation/nestedPages/create_booking.dart';

// ignore: must_be_immutable
class BookingsPage extends StatelessWidget {
  BookingsPage({super.key});

  List<BookingModel> bookings = [
    BookingModel(
      categoryAvatarUrl: 'https://randomuser.me/api/portraits/med/men/5.jpg',
      description: 'description',
      staffName: 'name',
      date: 'time',
      status: 'BookingStatus.PENDING',
    ),
    BookingModel(
      categoryAvatarUrl: 'https://randomuser.me/api/portraits/med/men/5.jpg',
      description: 'description',
      staffName: 'name',
      date: 'time',
      status: 'BookingStatus.COMPLETED',
    ),
    BookingModel(
      categoryAvatarUrl: 'https://randomuser.me/api/portraits/med/men/5.jpg',
      description: 'description',
      staffName: 'name',
      date: 'time',
      status: 'BookingStatus.CANCELLED',
    ),
    BookingModel(
      categoryAvatarUrl: 'https://randomuser.me/api/portraits/med/men/5.jpg',
      description: 'description',
      staffName: 'name',
      date: 'time',
      status: 'BookingStatus.PENDING',
    ),
    BookingModel(
      categoryAvatarUrl: 'https://randomuser.me/api/portraits/med/men/5.jpg',
      description: 'description',
      staffName: 'name',
      date: 'time',
      status: 'BookingStatus.COMPLETED',
    ),
    BookingModel(
      categoryAvatarUrl: 'https://randomuser.me/api/portraits/med/men/5.jpg',
      description: 'description',
      staffName: 'name',
      date: 'time',
      status: 'BookingStatus.CANCELLED',
    ),
    BookingModel(
      categoryAvatarUrl: 'https://randomuser.me/api/portraits/med/men/5.jpg',
      description: 'description',
      staffName: 'name',
      date: 'time',
      status: 'BookingStatus.PENDING',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: ListView.separated(
          itemCount: bookings.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: BookingTile(
                bookingModel: bookings[index],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 5,
            );
          },
        ),
      ),
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
          color: Color(0xffffffff),
        ),
      ),
    );
  }
}
