import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String circleAvatarUrl;
  final int avatarRadius;

  const UserAvatar({
    super.key,
    required this.circleAvatarUrl,
    required this.avatarRadius,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: circleAvatarUrl != ''
          ? NetworkImage(circleAvatarUrl)
          : Image.asset(
              'assets/images/avatar.png',
              fit: BoxFit.cover,
            ) as ImageProvider,
      onBackgroundImageError: (_, __) {
        Image.asset(
          'assets/images/avatar.png',
          fit: BoxFit.cover,
        );
      },
      radius: avatarRadius.toDouble(),
    );
  }
}
