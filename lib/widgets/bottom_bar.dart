import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './dice.dart';
import '../gameengine/model/game_manager.dart';
import '../gameengine/model/dice_model.dart';
class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dice = Provider.of<DiceModel>(context);
    return Container(
     child: Dice(dice,GameManager.userTurn())
    );
  }
}