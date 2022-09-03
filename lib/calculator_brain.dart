import 'package:flutter/material.dart';
import 'dart:math';


class CalculatorBrain {

  CalculatorBrain(this.height, this.weight){}

  int height ;
  int weight;

  double calculateBMI() {
    return weight / pow(height/100, 2);
  }

  String getResult(){
    if (calculateBMI() > 25) {
      return "Overweight";
    }else if (calculateBMI()> 18.5) {
      return "Normal";
    }else {
      return "Underweight";
    }
  }

  String getBMI() {
    var bmi = weight / pow(height/100, 2);
    return bmi.toStringAsFixed(1);
  }


  String getInterpretation(){
    if (calculateBMI()> 25) {
      return "You weight more than normal body weight. Try to exercise more";
    }else if (calculateBMI() > 18.5) {
      return "You have normal body weight. Good Job!";
    }else {
      return "You have lower than normal body weight. You need to eat more.";
    }
  }

}