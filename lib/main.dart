import 'package:flutter/material.dart';
import './widgets/board.dart';
import './gameengine/path.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  GlobalKey keyBar = GlobalKey();
  List<double> dimentions = [0, 0, 0, 0];
  List<List<GlobalKey>> keyRefrences;
  List<List<GlobalKey>> _getGlobalKeys() {
    List<List<GlobalKey>> keysMain = [];
    for (int i = 0; i < 15; i++) {
      List<GlobalKey> keys = [];
      for (int j = 0; j < 15; j++) {
        keys.add(GlobalKey());
      }
      keysMain.add(keys);
    }
    return keysMain;
  }

  List<double> _getPosition(int row, int column) {
    var listFrame = List<double>();
    double x;
    double y;
    double w;
    double h;
    final RenderBox renderBoxBar = keyBar.currentContext.findRenderObject();
    final sizeBar = renderBoxBar.size;
    final cellBoxKey = keyRefrences[row][column];
    final RenderBox renderBoxCell =
        cellBoxKey.currentContext.findRenderObject();
    final positionCell = renderBoxCell.localToGlobal(Offset.zero);
    x = positionCell.dx + 2;
    y = (positionCell.dy - sizeBar.height + 2);
    w = renderBoxCell.size.width - 4;
    h = renderBoxCell.size.height - 4;
    listFrame.add(x);
    listFrame.add(y);
    listFrame.add(w);
    listFrame.add(h);
    return listFrame;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    keyRefrences = _getGlobalKeys();
    return Scaffold(
      appBar: AppBar(
        key: keyBar,
        title: Text('Sample Code'),
      ),
      body: Stack(
        children: [
          Board(keyRefrences),
          AnimatedPositioned(
            duration: Duration(microseconds: 500),
            left: dimentions[0],
            top: dimentions[1],
            width: dimentions[2],
            height: dimentions[3],
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.purpleAccent),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
              dimentions = _getPosition(Path.greenPath[index][0], Path.greenPath[index][1]);
              index = index +1;
              setState(() {});
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
