import 'package:flutter/material.dart';
import 'package:spring_service/Pages/components/user_avatar.dart';
import 'package:spring_service/models/staff_model.dart';

class StaffTile extends StatelessWidget {
  final StaffModel staffModel;

  const StaffTile({
    super.key,
    required this.staffModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      UserAvatar(
        circleAvatarUrl: staffModel.circleAvatarUrl,
        avatarRadius: 20,
      ),
      const SizedBox(
        width: 10,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            staffModel.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          Text(
            staffModel.service,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 16,
              ),
              Text(
                staffModel.rating.toStringAsFixed(1),
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
      const Spacer(
        flex: 1,
      ),
      Text(
        '\$${staffModel.charge.toStringAsFixed(2)}/hr',
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.orange,
        ),
      ),
    ]);
  }
}
