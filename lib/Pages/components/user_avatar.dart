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
          ? NetworkImage(circleAvatarUrl!)
          : const AssetImage('assets/avatar.png') as ImageProvider,
      onBackgroundImageError: (_, __) {
        const AssetImage('assets/avatar.png');
      },
      radius: avatarRadius.toDouble(),
    );
  }
}
