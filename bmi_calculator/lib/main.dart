import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';

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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ImageButton(
              children: <Widget>[],
              width: 200,
              height: 200,
              label: Text('BMI Calculator',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              unpressedImage: Image.asset('assets/bmi.png'),
              pressedImage: Image.asset('assets/bmi.png'),
              mainAxisAlignment: MainAxisAlignment.end,
              onTap: () {
                print('BMI Button Pressed');
              },
            ),
            ImageButton(
              children: <Widget>[],
              width: 200,
              height: 200,
              label: Text('Weight Recorder',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              unpressedImage: Image.asset('assets/person.png'),
              pressedImage: Image.asset('assets/person.png'),
              mainAxisAlignment: MainAxisAlignment.end,
              onTap: () {
                print('Weight Button Presses');
              },
            ),
          ],
        ),
      ),
    );
  }
}
