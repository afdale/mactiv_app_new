import 'package:flutter/material.dart';
import 'package:Mactiv/ui/homeScreen.dart';
import 'package:Mactiv/ui/loginScreen.dart';
import 'package:Mactiv/ui/signupScreen.dart';
import 'package:Mactiv/ui/splashScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  var _splashShown = true;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Splash and Token Authentication",
      routes: <String,WidgetBuilder>{
        "/HomeScreen": (BuildContext context) => HomeScreen(),
        "/LoginScreen": (BuildContext context) => LoginScreen(),
        "/SignUpScreen": (BuildContext context) => SignUpScreen(),
        "/SplashScreen": (BuildContext context) => SplashScreen(),
      },
      home:
      SplashScreen(),


    );
  }

}
