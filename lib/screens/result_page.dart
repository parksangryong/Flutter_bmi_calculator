import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultPage({super.key, required this.bmiResult, required this.interpretation, required this.resultText});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR', style: textTheme.labelMedium),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            child: const Text('Your Result', style: TitleTextStyle),
          )),
          Expanded(
              flex: 5,
              child: ReusableCard(
                color: activeCardColour,
                onPress: () {},
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultText, style: resultTextStyle),
                    Text(
                      bmiResult,
                      style: BMITextStyle,
                    ),
                    Text(
                      interpretation,
                      style: const TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )),
          BottomButton(
              onPress: () {
                Navigator.pop(context);
              },
              title: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
