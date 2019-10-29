import 'package:flutter/material.dart';
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

  class HomePage extends StatelessWidget {
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
              padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 0.0),
              child: ListView(
                children: <Widget>[
                  /*Padding(
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
                  ),*/

                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:<Widget>[
                        RichText(
                          text: TextSpan(
                            text: '04.15',
                            style: TextStyle(fontFamily:'Proxima_nova',fontSize: 40.0,
                                color: Colors.black, fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(text: 'AM', style: TextStyle(fontFamily:'Proxima_nova',fontSize: 20.0,
                                  color: Colors.black, fontWeight: FontWeight.w100)
                              ),
                            ],
                          ),
                        ),

                        new InkWell(

                            child:
                            Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:
                                [
                                  new Text("Ahad, 5 May 2019", style:
                                  TextStyle(fontFamily:'Proxima_nova',fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w200, ),
                                  ),
                                  new Text("1 Ramadhan 1440 H", style:
                                  TextStyle(fontFamily:'Proxima_nova',fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w200, ),
                                  ),
                                ]
                            )
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
                    child: Container(
                      width: 15.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                          borderRadius: new BorderRadius.circular(20.0),
                          gradient: LinearGradient(
                              colors: <Color> [Color(0xFF00CDB3),Color(0xFF8BC2FF)]
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[300],
                              offset: Offset(0.0, 2.5),
                              blurRadius: 3.5,
                            ),
                          ]),
                      child: Material(
                        color: Colors.transparent,
                      ),
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
