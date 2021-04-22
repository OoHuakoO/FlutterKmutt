import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Measures Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyConverterPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyConverterPage extends StatefulWidget {
  MyConverterPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyConverterPageState createState() => _MyConverterPageState();
}

class _MyConverterPageState extends State<MyConverterPage> {
  double _numberFrom;
  String _startMeature;
  String _convertedMeature;
  String _resultMessage;
  final List<String> _measure = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pound (lbs)',
    'ounces',
  ];
  final Map<String, int> _measureMap = {
    'meters': 0,
    'kilometers': 1,
    'grams': 2,
    'kilograms': 3,
    'feet': 4,
    'miles': 5,
    'pound (lbs)': 6,
    'ounces': 7,
  };
  final dynamic _formulas = {
    '0': [1, 0.001, 0, 0, 3.28084, 0.000632371, 0, 0],
    '1': [1000, 1, 0, 0, 3280.84, 0.621371, 0, 0],
    '2': [0, 0, 1, 0.001, 0, 0, 0.00220462, 0.035274],
    '3': [0, 0, 1000, 1, 0, 0, 2.20462, 35.274],
    '4': [0.3048, 0.0003048, 0, 0, 1, 0.000189394, 0, 0],
    '5': [1609.34, 1.60934, 0, 0, 5280, 1, 0, 0],
    '6': [0, 0, 453.592, 0.453592, 0, 0, 1, 16],
    '7': [0, 0, 28.3495, 0.0283495, 3.28084, 0, 0.0625, 1],
  };
  @override
  void initState() {
    _numberFrom = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle inputStyle = TextStyle(
      fontSize: 20,
      color: Colors.blue[900],
    );
    final TextStyle labelStyle = TextStyle(
      fontSize: 24,
      color: Colors.grey[700],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Text('Value', style: labelStyle),
            Spacer(),
            TextField(
              style: inputStyle,
              decoration: InputDecoration(
                hintText: 'กรุณาใส่ตัวเลขที่ต้องการแปลง',
              ),
              onChanged: (text) {
                var rv = double.tryParse(text);
                if (rv != null) {
                  setState(() {
                    _numberFrom = rv;
                  });
                }
              },
            ),
            Spacer(),
            Text('From', style: labelStyle),
            DropdownButton(
              isExpanded: true,
              style: inputStyle,
              items: _measure.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: inputStyle,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _startMeature = value;
                });
              },
              value: _startMeature,
            ),
            Spacer(),
            Text('To', style: labelStyle),
            Spacer(),
            DropdownButton(
              isExpanded: true,
              style: inputStyle,
              items: _measure.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: inputStyle,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _convertedMeature = value;
                });
              },
              value: _convertedMeature,
            ),
            Spacer(flex: 2),
            ElevatedButton(
                onPressed: () {
                  if (_startMeature.isEmpty ||
                      _convertedMeature.isEmpty ||
                      _numberFrom == 0) {
                    return;
                  } else {
                    convert(_numberFrom, _startMeature, _convertedMeature);
                  }
                },
                child: Text(
                  'Convert',
                  style: inputStyle,
                )),
            Spacer(flex: 2),
            Text((_resultMessage == null) ? '' : _resultMessage,
            style : labelStyle
            ),
            Spacer(flex: 8),
          ],
        ),
      ),
    );
  }

  void convert(double value, String from, String to) {
    int nFrom = _measureMap[from];
    int nTo = _measureMap[to];
    var multiplier = _formulas[nFrom.toString()][nTo];
    var result = value * multiplier;
    if (result == 0) {
      _resultMessage = 'ไม่สามารถแปลงค่าได้';
    } else {
      _resultMessage =
          '${_numberFrom.toString()} $_startMeature มีค่าเท่ากับ ${result.toString()} $_convertedMeature';
    }
    setState(() {
      _resultMessage = _resultMessage;
    });
  }
}
