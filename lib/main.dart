import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';

import 'constants/constants.dart';

void main() {
  runApp(const BmiCalculator());
}

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xff0a0e21),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xff0A0E21)),
          sliderTheme: SliderThemeData(
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 30),
            thumbColor: bottomContanerColour,
            overlayColor: bottomContanerColour.withOpacity(0.2),
            activeTrackColor: Colors.white,
            inactiveTrackColor: grayColour,
          ),
          textTheme: const TextTheme(
              labelMedium:
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 20))),

      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const InputPage(),
      //   '/result': (context) => const ResultPage()
      // },
      home: const InputPage()
    );
  }
}
