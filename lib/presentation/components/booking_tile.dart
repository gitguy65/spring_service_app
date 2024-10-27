import 'package:flutter/material.dart';
import 'package:spring_service/constants/enums/booking_status.dart';
import 'package:spring_service/presentation/models/booking_model.dart';

class BookingTile extends StatelessWidget {
  final BookingModel bookingModel;

  const BookingTile({
    super.key,
    required this.bookingModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: Theme.of(context).colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // UserAvatar(
            //   circleAvatarUrl: bookingModel.categoryAvatarUrl,
            //   avatarRadius: 35,
            // ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: SizedBox(
                width: 80,
                child: Image.network(
                  bookingModel.categoryAvatarUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/avatar.png',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),

            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookingModel.description,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    bookingModel.staffName,
                    style: const TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Column(
                children: [
                  Text(
                    bookingModel.date,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child:
                        bookingModel.status == BookingStatus.PENDING.toString()
                            ? const Icon(
                                Icons.timer,
                                color: Colors.blue,
                              )
                            : bookingModel.status ==
                                    BookingStatus.COMPLETED.toString()
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  )
                                : const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
