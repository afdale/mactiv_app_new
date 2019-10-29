import 'package:flutter/material.dart';
import 'package:Mactiv/ui/loginScreen.dart';
import 'package:Mactiv/ui/signupScreen.dart';
import 'package:Mactiv/ui/splashScreen.dart';
import 'package:Mactiv/ui/Home.dart';
import 'package:Mactiv/ui/Keuangan.dart';
import 'package:Mactiv/ui/MactivBox.dart';
import 'package:Mactiv/ui/Pengumuman.dart';
import 'package:Mactiv/ui/Profile.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';


void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {

  @override
    State<StatefulWidget> createState(){
    return MyAppState();
  }
}
  var _splashShown = true;

class MyAppState extends State<MyApp> {
  int _selectedPage = 0;
  final _pageOptions = [
      HomePage(),
      PengumumanPage(),
      KeuanganPage(),
      MactivBoxPage(),
      ProfilePage(),

  ];
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Mactiv App",
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
     /* routes: <String, WidgetBuilder>{
        //"/HomeScreen": (BuildContext context) => HomeScreen(),
        "/LoginScreen": (BuildContext context) => LoginScreen(),
        "/SignUpScreen": (BuildContext context) => SignUpScreen(),
        "/SplashScreen": (BuildContext context) => SplashScreen(),
      },*/
      home: Scaffold(
        appBar: GradientAppBar(
          title: Text('Mactiv',style: TextStyle
            (fontFamily:'Proxima_nova', fontSize: 30.0,
              color: Colors.white, fontWeight: FontWeight.bold)),
          backgroundColorStart: new Color(0xFF00CABB),
          backgroundColorEnd: new Color (0xFF00E28C),
        ),

          body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color(0xFF00CABB)),
              title: Text('Home',style: TextStyle
                (fontFamily:'Proxima_nova', fontSize: 15.0,
                  color: Color(0xFF00CABB), fontWeight: FontWeight.bold))
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm, color: Color(0xFF00CABB)),
                title: Text('Pengumuman',style: TextStyle
                  (fontFamily:'Proxima_nova', fontSize: 15.0, color: Color(0xFF00CABB), fontWeight: FontWeight.bold))
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.attach_money, color: Color(0xFF00CABB)),
                title: Text('Keuangan',style: TextStyle
                  (fontFamily:'Proxima_nova', fontSize: 15.0, color: Color(0xFF00CABB), fontWeight: FontWeight.bold))
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.pageview, color: Color(0xFF00CABB)),
                title: Text('MactivBox',style: TextStyle
                  (fontFamily:'Proxima_nova', fontSize: 15.0, color: Color(0xFF00CABB), fontWeight: FontWeight.bold))
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.accessibility, color: Color(0xFF00CABB)),
                title: Text('Profile',style: TextStyle
                  (fontFamily:'Proxima_nova', fontSize: 15.0, color: Color(0xFF00CABB), fontWeight: FontWeight.bold))
            ),
          ],
        ),
      ),

    );
  }
  }

