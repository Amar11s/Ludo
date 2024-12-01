import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ludo/gameengine/model/dice_model.dart';
import '../model/token.dart';
import '../model/game_state.dart';
class GameManager {
  TokenType turn = TokenType.blue;
  int gameTurn;
  static final GameManager _shared = GameManager._internal();
  GameManager._internal();
  factory GameManager() {
    //observe for game changes next moves
    setGamestream();
    return _shared;
  }
  static setGamestream() {
    // Firestore.instance.collection('game').snapshots().listen((data) {
    //   int turn = data.documents[0]['sender'];
    //   if(turn != _shared.turn.index){
    //   var moveType = data.documents[0]['type'];  
    //   int step = data.documents[0]['dice'];
    //   _shared.gameTurn = data.documents[0]['turn'];
    //   var move = data.documents[0]['move'];
    //    if(move.containsKey('token') && moveType == 'move')
    //    {
    //   var token = Token.fromjson(json.decode(move['token']));
    //   int steps = move['step'];
    //     GameState().moveToken(token, steps);
    //    }
    //   if (step != null && step < 7 && moveType == 'dice_roll') {
    //     setDice(step);
    //   }
    //   }
    // });
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
          .document('<YOUR KEY>')
          .updateData({'dice': DiceModel().diceOne, 'sender':_shared.turn.index,'turn':0,'type':'dice_roll'});
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

//Check If user can move
 static bool userTurn() {
    if (_shared.turn.index == _shared.gameTurn) return true;
    return false;
  }

// color for indicator
  Color indicator() {
    switch (this.turn) {
      case TokenType.green:
        return Colors.lightGreenAccent;
      case TokenType.yellow:
        return Colors.yellowAccent;
      case TokenType.blue:
        return Colors.lightBlueAccent;
      case TokenType.red:
        return Colors.redAccent;
    }
    return Colors.transparent;
  }
   postMove(Token token, int step){
      Firestore.instance
          .collection('game')
          .document('<YOUR KEY>')
          .updateData({'move':{'token': jsonEncode(token),'step':step}, 'sender':turn.index,'turn':0,'type':'move'});
   }
}
