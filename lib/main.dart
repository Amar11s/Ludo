import 'package:flutter/material.dart';
import './gameengine/model/game_state.dart';
import './widgets/gameplay.dart';
import 'package:provider/provider.dart';
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
      home: ChangeNotifierProvider<GameState>(
        create: (context)=>GameState(),
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
  void _onPressed() {
    // for (int i = 0; i < Path.redPath.length; i++) {
    //   int duration = 100 + (i * 300);
    //   var future = new Future.delayed(Duration(milliseconds: duration), () {
    //     setState(() {
    //     dimentions =
    //         _getPosition(Path.redPath[i][0], Path.redPath[i][1]);
    //     });
    //   });
    // }
  }
  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);
    return Scaffold(
      appBar: AppBar(
        key: keyBar,
        title: Text('Sample Code'),
      ),
      body: GamePlay(keyBar,gameState),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressed,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
