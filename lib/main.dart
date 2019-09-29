import 'package:flutter/material.dart';
import 'package:mactiv_app_new/ui/homeScreen.dart';
import 'package:mactiv_app_new/ui/loginScreen.dart';
import 'package:mactiv_app_new/ui/splashScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  var _splashShown = false;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Splash and Token Authentication",
      routes: <String,WidgetBuilder>{
        "/HomeScreen": (BuildContext context) => HomeScreen(),
        "/LoginScreen": (BuildContext context) => LoginScreen(),
      },
      home:
      SplashScreen(),


    );
  }

}
