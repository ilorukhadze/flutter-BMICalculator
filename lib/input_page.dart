import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi/IconContent.dart';
import 'Reusable_Card.dart';
import 'constants.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

Color maleCardColor = kInactiveCardColor;
Color femaleCardColor = kInactiveCardColor;

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 80;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('BMI Calculator'))),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild:
                        IconContent(icon: FontAwesomeIcons.mars, label: "MALE"),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                        icon: FontAwesomeIcons.venus, label: "FEMALE"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: ReusableCard(
              colour: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(child: Text("HEIGHT", style: kLabelTextStyle) ,padding: EdgeInsets.only(top:5),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(),style: kNumberTextStyle),
                      Text("cm", style: kLabelTextStyle)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0X29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.00,
                      max: 220.00,
                      inactiveColor: const Color(0xFF8D8E98),
                      onChanged: (double newValue ) {
                        setState(() {
                          height = newValue.round();
                        });
                      },

                    ),
                  )
                ]
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Expanded(
                    flex: 1, child: ReusableCard(colour: kInactiveCardColor,
                cardChild :  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text( "WEIGHT", style:kLabelTextStyle),
                    Text(weight.toString(),style: kNumberTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2),
                          child: RoundIconButton(icon: FontAwesomeIcons.plus, onPress: () => setState(() {
                            weight++;
                          })),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2),
                          child: RoundIconButton(icon: FontAwesomeIcons.minus,onPress: () => setState(() {
                            weight--;
                          }),),
                        ),
                      ],
                    ),
                  ],
                ))),
                Expanded(
                    flex: 1, child: ReusableCard(colour: kInactiveCardColor,
                  cardChild :  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text( "AGE", style:kLabelTextStyle),
                    Text(age.toString(),style: kNumberTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2),
                          child: RoundIconButton(icon: FontAwesomeIcons.plus, onPress: () => setState(() {
                            age++;
                          })),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2),
                          child: RoundIconButton(icon: FontAwesomeIcons.minus,onPress: () => setState(() {
                            age--;
                          }),),
                        ),
                      ],
                    ),
                  ],
                ),),
                ),
              ],
            ),
          ),
          BottomButton(onTap: () {
            CalculatorBrain calc = CalculatorBrain(height, weight);
            Navigator.pushNamed(context,"/result",arguments: calc
            );
          }, text: 'Calculate',)
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {

  final VoidCallback? onTap;
  final String text ;

  BottomButton({required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.only(top: 10),
          width: double.infinity,
          color: Color(0xFFEB1555),
          height: kBottomContainerHeight,
          child:  Center(child: Text(text, style: kLargeButtonStyle))

      )
    );
  }
}


class RoundIconButton extends StatelessWidget {

  final IconData? icon;
  final VoidCallback? onPress;

  RoundIconButton({this.icon,this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: onPress,
        elevation: 6,
        constraints: const BoxConstraints.tightFor(
            width: 56.0,
            height: 56.0,),
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
        child: Icon(icon)

    );
  }
}

