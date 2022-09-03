import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:bmi/Reusable_Card.dart';
import 'input_page.dart';
import 'calculator_brain.dart';

class ResultPage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as CalculatorBrain;
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator")),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(top: 20,left: 30),
                child: Text(
                  "Your Result",
                  style: kYourResultTitle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        args.getResult(),
                        style: kResultText,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        args.getBMI(),
                        style: kResultScoreText,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            args.getInterpretation(),
                            style: kResultFullText,
                            textAlign: TextAlign.center,
                          ))
                    ]),
              ),
            ),
            BottomButton(text: 'Re-Calculate', onTap: () {
              Navigator.pop(context);
            },)
          ]),
    );
  }
}
