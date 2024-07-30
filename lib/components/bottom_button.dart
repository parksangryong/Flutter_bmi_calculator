
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class BottomButton extends StatelessWidget{
  final VoidCallback onPress;
  final String title;

  const BottomButton({super.key, required this.onPress, required this.title});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onPress,
      child: Container(
        height: bottomContainerHeight,
        width: double.infinity,
        color: bottomContanerColour,
        margin: const EdgeInsets.only(top: 10),
        child: Center(
          child: Text(
            title,
            style: ButtonTextStyle,
          ),
        ),
      ),
    );
  }
}