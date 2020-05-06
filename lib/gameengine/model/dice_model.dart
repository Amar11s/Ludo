import 'dart:math';
import 'package:flutter/material.dart';
class DiceModel with ChangeNotifier {
  static final DiceModel _shared =   DiceModel._internal(); 
  DiceModel._internal(); 
  factory   DiceModel() => _shared;
  int diceOne = 1;
  int get diceOneCount => diceOne;
  void generateDiceOne() {
    diceOne = Random().nextInt(6) + 1;
    notifyListeners();
  }
  void setDice(int value){
    diceOne = value;
    notifyListeners();
  }
}