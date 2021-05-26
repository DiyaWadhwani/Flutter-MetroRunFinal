import 'package:flutter/material.dart';

class MapDisplayPage extends StatefulWidget {
  @override
  _MapDisplayPageState createState() => _MapDisplayPageState();
}

class _MapDisplayPageState extends State<MapDisplayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(child: Image.asset("assets/MetroMap.jpg")),
          OutlinedButton(
              onPressed: () {
                print("Heading to home_page");
                Navigator.of(context).pushNamed('/homepage');
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.green[800],
              ))
        ],
      ),
    );
  }
}
