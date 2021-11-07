import 'package:flutter/material.dart';
import 'package:tdd_eds/core/styles/utils.dart';

class UserInfoItem extends StatelessWidget {
  const UserInfoItem({
    Key? key,
    required this.name,
    required this.title,
  }) : super(key: key);

  final String name;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Text(
                '$title ',
                style: MyTextStyles.header3.copyWith(color: MyColors.grey),
              ),
              const Spacer(),
              Text(
                name,
                style: MyTextStyles.body,
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
