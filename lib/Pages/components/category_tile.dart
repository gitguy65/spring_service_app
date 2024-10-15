import 'package:flutter/material.dart';
import 'package:spring_service/Pages/components/user_avatar.dart';
import 'package:spring_service/models/category_model.dart';

class CategoryTile extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryTile({
    super.key,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserAvatar(
          circleAvatarUrl: categoryModel.categoryImageUrl,
          avatarRadius: categoryModel.categoryImageRadius.toInt(),
        ),
        Text(
          categoryModel.categoryName,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
