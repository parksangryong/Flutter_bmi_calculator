

import 'package:flutter/material.dart';

import '../constants/constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPress;

  const RoundIconButton({super.key, required this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: onPress,
        shape: const CircleBorder(),
        fillColor: buttonColour,
        constraints: const BoxConstraints.tightFor(
            width: 56,
            height: 56
        ),
        elevation: 0,
        child: Icon(icon, color: Colors.white)

    );
  }
}