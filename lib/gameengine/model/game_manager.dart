import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ludo/gameengine/model/dice_model.dart';
import 'dart:convert';
import './game_state.dart';

class GameManager {
  static final GameManager _shared = GameManager._internal();
  GameManager._internal();
  factory GameManager() {
    //observe for game changes next moves
    setGamestream();
    return _shared;
  }
  static setGamestream() {
    Firestore.instance.collection('game').snapshots().listen((data) {
      int step = data.documents[0]['dice'];
      if (step != null && step < 7) {
        setDice(step);
      }
    });
  }

  //update dice
  static updateDices() {
    var duration = 0;
    for (int i = 0; i < 6; i++) {
      duration = duration + 100;
      var future = Future.delayed(Duration(milliseconds: duration), () {
        DiceModel().generateDiceOne();
      });
    }
    var future = Future.delayed(Duration(milliseconds: duration), () {
      Firestore.instance
          .collection('game')
          .document('XPXpI4WXvwkCMhFHVReD')
          .updateData({'dice': DiceModel().diceOne});
    });
  }

  //set dice
  static setDice(int value) {
    var duration = 0;
    for (int i = 0; i < 6; i++) {
      duration = duration + 100;
      var future = Future.delayed(Duration(milliseconds: duration), () {
        DiceModel().generateDiceOne();
      });
    }
    var future = Future.delayed(Duration(milliseconds: duration), () {
      DiceModel().setDice(value);
    });
  }
}
