import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:Mactiv/common/functions/showDialogSingleButton.dart';
import 'package:Mactiv/common/platform/platformScaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

const URL = "http://www.google.com";

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeScreenState();
  }

}


class HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    super.initState();
    _saveCurrentRoute("/HomeScreen");
  }

  _saveCurrentRoute(String lastRoute) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('LastScreenRoute', lastRoute);
  }


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () {
        if(Navigator.canPop(context)) {
          Navigator.of(context).pushNamedAndRemoveUntil('/SplashScreen', (Route<dynamic> route) => false);
        } else {
          Navigator.of(context).pushReplacementNamed('/SplashScreen');
        }
        return;
      },
      child:
      PlatformScaffold(

        backgroundColor: Colors.white,
        body: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 0.0),
            child: ListView(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 320.0, 10.0),
                    child: GestureDetector(
                      child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:AssetImage("assets/icon_mactiv.png"),
                                fit:BoxFit.fill
                            ),
                          )
                      ),
                    )
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'Selamat datang di',
                      style: TextStyle(fontFamily:'Proxima_nova',fontSize: 20.0,
                          color: Colors.black, fontWeight: FontWeight.w200),
                      children: <TextSpan>[
                        TextSpan(text: ' MactivBox,', style: TextStyle(fontFamily:'Proxima_nova',fontSize: 20.0,
                            color: Colors.black, fontWeight: FontWeight.bold)
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'Silahkan Home',
                      style: TextStyle(fontFamily:'Proxima_nova',fontSize: 20.0,
                          color: Colors.black, fontWeight: FontWeight.w200),
                    ),
                  ),
                ),



                Padding(
                  padding: EdgeInsets.fromLTRB(240.0, 10.0, 0.0, 0.0),
                  child: Text("Lupa Password?", style: TextStyle(fontFamily:'Proxima_nova',fontSize: 20.0,
                    color: Colors.green, fontWeight: FontWeight.w200, ),
                  ),
                ),


                //const SizedBox(height: 20),



                Padding(
                  padding: EdgeInsets.fromLTRB(120.0, 10.0, 0.0, 0.0),
                  child: Text("Home menggunakan", style: TextStyle(fontFamily:'Proxima_nova',fontSize: 18.0,
                    color: Colors.black, fontWeight: FontWeight.w100, ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:<Widget>[
                      GestureDetector(
                          child: Container(
                              width: 175,
                              height: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/btn_googleHome.png"),
                                    fit:BoxFit.cover
                                ),
                              )
                          ),onTap:(){
                        print("google");
                      }
                      ),


                      GestureDetector(
                          child: Container(
                              width: 175,
                              height: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/btn_fbHome.png"),
                                    fit:BoxFit.cover
                                ),
                              )
                          ),onTap:(){
                        print("facebook");
                      }
                      )
                    ],
                  ),
                ),


                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget>[
                      Text("Belum punya akun?", style:
                      TextStyle(fontFamily:'Proxima_nova',fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w100, ),
                      ),

                      new InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed('/SignUpScreen');
                        },
                        child:new Text("Daftar", style:
                        TextStyle(fontFamily:'Proxima_nova',fontSize: 18.0, color: Colors.green, fontWeight: FontWeight.bold, ),
                        ),
                      ),
                    ],
                  ),

                ),

              ],
            ),

          ),
        ),
      ),
    );
  }
}
