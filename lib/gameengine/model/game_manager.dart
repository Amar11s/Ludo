import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ludo/gameengine/model/dice_model.dart';
import '../model/game_state.dart';
class GameManager{
  static final GameManager _shared = GameManager._internal();
  GameManager._internal();

  factory GameManager(){
  Firestore.instance.collection('game')
     .snapshots().listen((data){
       int step = data.documents[0]['dice'];
       setDice(step);
     });
    return _shared;
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

    //   Firestore.instance.collection('game')
    //   .document('XPXpI4WXvwkCMhFHVReD').updateData({'dice':DiceModel().diceOne});
    // });

    Firestore.instance.collection('game').add(GameState());
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
 //  

}