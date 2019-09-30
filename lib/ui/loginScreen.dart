import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mactiv_app_new/common/apifunctions/requestLoginAPI.dart';
import 'package:mactiv_app_new/common/functions/showDialogSingleButton.dart';
import 'package:mactiv_app_new/common/platform/platformScaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

const URL = "http://www.google.com";

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginScreenState();
  }

}

class LoginScreenState extends State<LoginScreen> {

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future launchURL(String url) async {
    if(await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      showDialogSingleButton(context, "Unable to reach your website.",
          "Currently unable to reach the website $URL. Please try again at a later time.", "OK");
    }
  }

  @override
  void initState() {
    super.initState();
    _saveCurrentRoute("/LoginScreen");
  }

  _saveCurrentRoute(String lastRoute) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('LastScreenRoute', lastRoute);
  }

  @override
  Widget build(BuildContext context) {
    var drawer = Drawer();
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
                    padding: EdgeInsets.fromLTRB(0.0, 25.0, 120.0, 25.0),
                    child: GestureDetector(
                        child: Container(
                            height: 85,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:AssetImage("assets/icon_tv_login.png"),
                                  fit:BoxFit.cover
                              ),
                            )
                        ),
                    )
                ),

               /* Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
                  child: Text("Email", style: TextStyle(fontFamily:'Proxima_nova',
                    fontSize: 18.0, color: Colors.green, fontWeight: FontWeight.bold, ),
                  ),
                ),*/

                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 0.0),
                  child: TextField(
                    controller: _userNameController,
                    decoration: InputDecoration(
                      hintText: "Email",
                    ),
                    style: TextStyle(fontFamily:'Proxima_nova', fontSize: 18.0, color: Colors.grey, fontWeight: FontWeight.bold, ),
                  ),
                ),


                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                    obscureText: true,
                    style: TextStyle(fontFamily:'Proxima_nova', fontSize: 18.0, color: Colors.grey, fontWeight: FontWeight.bold, ),
                  ),
                ),

          Padding(
            padding: EdgeInsets.fromLTRB(250.0, 5.0, 0.0, 0.0),
                child: Text("Lupa Password?", style: TextStyle(fontFamily:'Proxima_nova',
                  fontSize: 18.0, color: Colors.green, fontWeight: FontWeight.bold, ),
                ),
          ),

                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                  child: GestureDetector(
                      child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:AssetImage("assets/btn_login.png"),
                                  fit:BoxFit.cover
                              ),
                          )
                      ),onTap:(){
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                    requestLoginAPI(context, _userNameController.text, _passwordController.text);
                  }
                  )
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(120.0, 10.0, 0.0, 0.0),
                  child: Text("Login menggunakan", style: TextStyle(fontFamily:'Proxima_nova',fontSize: 18.0,
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
                              image: AssetImage("assets/btn_googlelogin.png"),
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
                              image: AssetImage("assets/btn_fblogin.png"),
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
