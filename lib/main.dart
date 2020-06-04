import 'package:flutter/material.dart';
import 'package:ludo/gameengine/model/game_manager.dart';
import './gameengine/model/game_state.dart';
import './widgets/gameplay.dart';
import 'package:provider/provider.dart';
import './widgets/bottom_bar.dart';
import './gameengine/model/dice_model.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>GameState()),
          ChangeNotifierProvider(create: (context)=>DiceModel()),
        ],
        child: MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey keyBar = GlobalKey();
  final GameManager manager = GameManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: keyBar,
        title: Text('Sample Code'),
      ),
      body: GamePlay(keyBar),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: BottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
