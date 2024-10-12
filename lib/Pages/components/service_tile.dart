import 'package:flutter/material.dart';
import 'package:spring_service/Pages/components/user_avatar.dart';

class ServiceTile extends StatelessWidget {
  final String categoryImageUrl;
  final double categoryImageRadius;
  final String categoryName;

  const ServiceTile({
    super.key,
    required this.categoryImageUrl,
    required this.categoryImageRadius,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserAvatar(
          circleAvatarUrl: categoryImageUrl,
          avatarRadius: categoryImageRadius.toInt(),
        ),
        Text(
          categoryName,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
