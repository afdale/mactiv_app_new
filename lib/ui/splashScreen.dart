import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() =>  _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int splashDuration = 1;

  startTime() async {
    return Timer(
        Duration(seconds: splashDuration),
            () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          Navigator.of(context).pushReplacementNamed('/LoginScreen');
        }
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {

    child:
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
          children: <Widget>[
            Container(
                      decoration: BoxDecoration(
                        color: new Color(0xFF00CABB),
                          gradient: LinearGradient(
                            colors: [new Color(0xFF00CABB), new Color (0xFF00E28C)],
                            begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                        )
                      )
                  ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    child: GestureDetector(
                      child: Container(
                          height: 120,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:AssetImage("assets/splashscreen.png"),
                                fit:BoxFit.fill
                            ),
                          )
                      ),
                    )
                ),
              ],
            )
                ]
      )
    );

    
  }
}