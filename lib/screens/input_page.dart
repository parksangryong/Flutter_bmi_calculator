import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/utils/calculate_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/reusable_card.dart';
import '../components/round_icon_button.dart';
import '../constants/constants.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  double height = 180.0;
  double weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR', style: textTheme.labelMedium),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.male
                          ? inactiveCardColour
                          : activeCardColour,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "MALE",
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      color: selectedGender == Gender.female
                          ? inactiveCardColour
                          : activeCardColour,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: "FEMALE",
                      )),
                ),
              ],
            )),
            Expanded(
                child: ReusableCard(
                    onPress: () {},
                    color: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('HEIGHT', style: labelTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(height.toStringAsFixed(1),
                                style: numberTextStyle),
                            const Text('cm', style: labelTextStyle)
                          ],
                        ),
                        Slider(
                          min: 120.0,
                          max: 220.0,
                          value: height,
                          onChanged: (double value) {
                            setState(() {
                              height = value;
                            });
                          },
                        ),
                      ],
                    ))),
            Expanded(
                child: Row(children: [
              Expanded(
                child: ReusableCard(
                    onPress: () {},
                    color: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('WEIGHT', style: labelTextStyle),
                        Text(weight.toStringAsFixed(1), style: numberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight -= 0.5;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight += 0.5;
                                  });
                                })
                          ],
                        ),
                      ],
                    )),
              ),
              Expanded(
                child: ReusableCard(
                    onPress: () {},
                    color: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(age.toString(), style: numberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        )
                      ],
                    )),
              ),
            ])),
            BottomButton(
                onPress: () {
                  CalculateBrain calc =
                      CalculateBrain(weight: weight, height: height);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ResultPage(
                                bmiResult: calc.calculateBMI(),
                                interpretation: calc.getInterpretation(),
                                resultText: calc.getResult(),
                              )));
                  // Navigator.pushNamed(context, '/result');
                },
                title: 'CALCULATE')
          ],
        ));
  }
}
