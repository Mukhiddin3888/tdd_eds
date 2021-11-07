import 'package:flutter/material.dart';
import 'package:tdd_eds/core/styles/utils.dart';

class ErrorButton extends StatelessWidget {
  const ErrorButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
          decoration: BoxDecoration(
              color: MyColors.blue,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Text('Error while loading',
            style: MyTextStyles.header3.copyWith(color: MyColors.white),)),
    );
  }
}