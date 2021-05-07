import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My BMI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyMainPage(title: 'My BMI App'),
    );
  }
}

class MyMainPage extends StatefulWidget {
  MyMainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                showCupertinoModalBottomSheet(
                  duration: Duration(milliseconds: 500),
                  context: context,
                  builder: (context) => WeightInputFormPage(),
                );
              },
              child: Icon(
                Icons.add,
                size: 35.0,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 35),
              child: ImageButton(
                children: <Widget>[],
                width: 200,
                height: 200,
                label: Text('BMI Calculator',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                unpressedImage: Image.asset('assets/bmi.png'),
                pressedImage: Image.asset('assets/bmi.png'),
                mainAxisAlignment: MainAxisAlignment.end,
                onTap: () {
                  print('BMI Button Pressed');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BMICalculatorPage()));
                },
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
              child: ImageButton(
                children: <Widget>[],
                width: 200,
                height: 200,
                label: Text('Weight Recorder',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                unpressedImage: Image.asset('assets/person.png'),
                pressedImage: Image.asset('assets/person.png'),
                mainAxisAlignment: MainAxisAlignment.end,
                onTap: () {
                  print('Weight Button Presses');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WeightRecorderPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BMICalculatorPage extends StatefulWidget {
  @override
  _BMICalculatorPageState createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Center(child: Text('BMI Page')),
    );
  }
}

class WeightRecorderPage extends StatefulWidget {
  @override
  _WeightRecorderPageState createState() => _WeightRecorderPageState();
}

class _WeightRecorderPageState extends State<WeightRecorderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weight Recorder')),
      body: Center(child: Text('Weight Recorder Page')),
    );
  }
}

class WeightInputFormPage extends StatefulWidget {
  @override
  _WeightInputFormPageState createState() => _WeightInputFormPageState();
}

class _WeightInputFormPageState extends State<WeightInputFormPage> {
  // ตัวแปรของหน้านี้
  List<Text> _myWeightList = [];
  int _myTodayWeight = 0;
  // ฟังกชันการทำงาน
  List<Text> showWeightList(int count) {
    for (var i = 35; i <= count; i++) {
      var myTextWeightWidget = Text('${i}');
      _myWeightList.add(myTextWeightWidget);
    }
    return _myWeightList;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.fromLTRB(35.0, 35.0, 35.0, 35.0),
        color: Colors.yellow.shade100,
        child: Column(
          children: <Widget>[
            Text(
              'Select Your Weight as of',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),
            Text(
              'xxxxxxxxx',
              style: TextStyle(fontSize: 20.0),
            ),
            Container(
              height: 200,
              child: CupertinoPicker(
                  itemExtent: 35,
                  onSelectedItemChanged: (value) {
                    setState(() {
                      print('value ${value}');
                      print('_myWeightList.length ${_myWeightList.length}');
                      var weightOrder = value % _myWeightList.length;
                      _myTodayWeight =
                          int.parse(_myWeightList[weightOrder].data);
                    });
                  },
                  scrollController:
                      FixedExtentScrollController(initialItem: 35),
                  children: showWeightList(100)),
            ),
            Text(
              '$_myTodayWeight kg',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45.0),
            ),
          ],
        ),
      ),
    );
  }
}
