import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: DetailArea(),
    );
  }
}

class DetailArea extends StatefulWidget {
  @override
  _DetailAreaState createState() => _DetailAreaState();
}

class _DetailAreaState extends State<DetailArea> {
  int _MyCounter = 0;
  void myButtonPressed() {
    print("Button Pressed");
    setState(() {
      _MyCounter = _MyCounter + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hit Button to Increase Counter'),
            Text('$_MyCounter',
                style: TextStyle(
                    fontSize: 60,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: myButtonPressed,
        child: Icon(Icons.add),
      ),
    );
  }
}
