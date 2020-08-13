import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  int _people = 0;
  String _infoText = 'Pode Entrar!';

  void _changePeople(int x) {
    setState(() => {
        _people += x,
        if(_people < 0) {
          _infoText = 'Mundo Invertido?!'
        } else if (_people <= 10) {
          _infoText = 'Pode Entrar!'
        } else {
          _infoText = 'Lotado!'
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de Pessoas',
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
      home: Stack(
        children: <Widget>[
          Image.asset(
              'images/original.jpg',
              fit: BoxFit.cover,
              height: 1080.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Pessoas: $_people',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                        onPressed: () => {
                          _changePeople(1)
                        },
                        child: Text('+1',
                          style: TextStyle(fontSize: 40.0,
                              color: Colors.white
                          ),
                        )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                        onPressed: () => {
                          _changePeople(-1)
                        },
                        child: Text('-1',
                          style: TextStyle(fontSize: 40.0,
                              color: Colors.white
                          ),
                        )
                    ),
                  )
                ],
              ),
              Text(_infoText,
                style: TextStyle(color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 38.0
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}