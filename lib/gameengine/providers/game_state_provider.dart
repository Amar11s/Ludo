import 'dart:math';
import 'package:flutter/material.dart';
class GameStateProvider with ChangeNotifier{
  int firstTurn;
  GameStateProvider(){
    firstTurn = Random().nextInt(4);
  }
   
}