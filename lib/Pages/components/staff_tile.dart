import 'package:flutter/material.dart';
import 'package:spring_service/Pages/components/user_avatar.dart';

class StaffTile extends StatelessWidget {
  final String circleAvatarUrl;
  final String name;
  final String service;
  final double rating;
  final double charge;

  const StaffTile({
    super.key,
    required this.circleAvatarUrl,
    required this.name,
    required this.service,
    required this.rating,
    required this.charge,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      UserAvatar(
        circleAvatarUrl: circleAvatarUrl,
        avatarRadius: 20,
      ),
      const SizedBox(
        width: 10,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          Text(
            service,
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
                rating.toStringAsFixed(1),
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
        '\$${charge.toStringAsFixed(2)}/hr',
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.orange,
        ),
      ),
    ]);
  }
}
