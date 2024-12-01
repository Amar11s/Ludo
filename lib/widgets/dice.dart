import 'package:flutter/material.dart';
import 'package:ludo/gameengine/model/game_manager.dart';
import '../gameengine/model/dice_model.dart';
import '../widgets/count_down_timer.dart';
class Dice extends StatelessWidget {
  final DiceModel dice;
  final bool turn;
  Dice(this.dice,this.turn);
  @override
  Widget build(BuildContext context) {
    List<String> _diceOneImages = [
      "assets/1.png",
      "assets/2.png",
      "assets/3.png",
      "assets/4.png",
      "assets/5.png",
      "assets/6.png",
    ];
    final c = dice.diceOneCount;
    var img = Image.asset(
      _diceOneImages[c - 1],
      gaplessPlayback: true,
      fit: BoxFit.fill,
    );
    List<String> _diceGreyImages = [
      "assets/1g.png",
      "assets/2g.png",
      "assets/3g.png",
      "assets/4g.png",
      "assets/5g.png",
      "assets/6g.png",
    ];
    final cc = dice.diceOneCount;
    var imgg = Image.asset(
      _diceGreyImages[cc - 1],
      gaplessPlayback: true,
      fit: BoxFit.fill,
    );

    _rollDice() {
        GameManager.updateDices();
    }
    return Card(
    shape: RoundedRectangleBorder(
    side: BorderSide(color: Colors.white70, width: 1),
    borderRadius: BorderRadius.circular(27),
  ),
      elevation: 10,
      child: Container(
        height: 54,
        width: 54,
        child: Stack(
          children: <Widget>[
            CountDownTimer(true),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: turn? () => _rollDice(): null,
                          child: turn? img : imgg,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
