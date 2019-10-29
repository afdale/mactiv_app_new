import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:Mactiv/common/apifunctions/requestLoginAPI.dart';
import 'package:Mactiv/common/functions/showDialogSingleButton.dart';
import 'package:Mactiv/common/platform/platformScaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

const URL = "http://www.google.com";

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginScreenState();
  }

}

ProgressDialog pr;

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

    pr = new ProgressDialog(context,type:
    ProgressDialogType.Normal, isDismissible: true, showLogs: true);

    pr.style(
        message: 'Login',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.green, fontFamily:'Proxima_nova', fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.green, fontFamily:'Proxima_nova', fontSize: 19.0, fontWeight: FontWeight.w600)
    );

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
                      text: 'Silahkan Login',
                      style: TextStyle(fontFamily:'Proxima_nova',fontSize: 20.0,
                          color: Colors.black, fontWeight: FontWeight.w200),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 15.0, 10.0, 0.0),
                  child: TextField(
                    controller: _userNameController,
                    decoration: InputDecoration(
                      hintText: "Email",
                    ),
                    style: TextStyle(fontFamily:'Proxima_nova', fontSize: 18.0, color: Colors.grey, fontWeight: FontWeight.bold, ),
                  ),
                ),


                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 5.0, 10.0, 0.0),
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                    obscureText: true,
                    style: TextStyle(fontFamily:'Proxima_nova', fontSize: 18.0, color: Colors.grey, fontWeight: FontWeight.bold),
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
                  padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 0.0),
                  child: Container(
                    width: 15.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: new BorderRadius.circular(40.0),
                        gradient: LinearGradient(
                      colors: <Color> [Color(0xFF00CABB),Color(0xFF00E28C)]
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
                      child: InkWell(
                          onTap: (){
                            pr.show();
                            pr.hide().then((isHidden) {
                              print(isHidden);
                            });
                            SystemChannels.textInput.invokeMethod('TextInput.hide');
                            requestLoginAPI(context, _userNameController.text, _passwordController.text);
                          },
                          child: Center(
                            child: const Text('Login', style: TextStyle
                              (fontFamily:'Proxima_nova', fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold)),
                          )),
                    ),
                  ),
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
