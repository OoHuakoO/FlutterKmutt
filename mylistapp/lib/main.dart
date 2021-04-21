import 'package:flutter/material.dart';
import 'contact.dart';
import 'package:url_launcher/url_launcher.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyListPage(title: 'My List Example'),
    );
  }
}

class MyListPage extends StatefulWidget {
  MyListPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  @override
  Widget build(BuildContext context) {
    List<Contact> myContactList = [
      Contact(
          'Worasit Choochaiwattana', '099-999-9999', 'assets/Images/b1.png'),
      Contact('Wicha Chareonsuk', '091-123-4567', 'assets/Images/b2.png'),
      Contact('Anuwat Rattanasomboon', '099-999-9999', 'assets/Images/g1.png'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: myContactList.length,
        itemBuilder: (BuildContext context, int index) {
          Contact myContact = myContactList[index];
          return ListTile(
            leading: Image.asset(myContact.imageName),
            title: Text(myContact.name),
            subtitle: Text(myContact.phoneNumber),
            onTap: () {
              launch('tel: ${myContact.phoneNumber}');
            },
          );
        },
      ),
    );
  }
}
