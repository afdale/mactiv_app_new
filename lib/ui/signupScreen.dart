import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Mactiv/common/platform/platformScaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Mactiv/common/apifunctions/requestRegisterAPI.dart';
import 'package:progress_dialog/progress_dialog.dart';



class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SignUpScreenState();
  }
}

ProgressDialog pr;

  class SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _saveCurrentRoute("/SignUpScreenState");
  }
  _saveCurrentRoute(String lastRoute) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('LastScreenRoute', lastRoute);
  }

  @override
  Widget build(BuildContext context) {

    pr = new ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: true, showLogs: true);

    pr.style(
        message: 'Mendaftarkan Akun Anda',
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
          Navigator.of(context).pushNamedAndRemoveUntil('/LoginScreen', (Route<dynamic> route) => false);
        } else {
          Navigator.of(context).pushReplacementNamed('/LoginScreen');
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
                    padding: EdgeInsets.fromLTRB(0.0, 25.0, 180.5, 25.0),
                    child: GestureDetector(
                      child: Container(
                          height: 65,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:AssetImage("assets/icon_tv_register.png"),
                                fit:BoxFit.cover
                            ),
                          )
                      ),
                    )
                ),


                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child: TextField(
                    controller: _fullnameController,
                    decoration: InputDecoration(
                      hintText: "Nama Anda",
                    ),
                    style: TextStyle(fontSize: 18.0, color: Colors.grey, fontWeight: FontWeight.bold, ),
                  ),
                ),



                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                    style: TextStyle(fontFamily:'Proxima_nova',
                      fontSize: 18.0, color: Colors.grey, fontWeight: FontWeight.bold, ),
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
                    style: TextStyle(fontFamily:'Proxima_nova',
                      fontSize: 18.0, color: Colors.grey, fontWeight: FontWeight.bold, ),
                  ),
                ),


                Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                    child: GestureDetector(
                        child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:AssetImage("assets/btn_daftar.png"),
                                  fit:BoxFit.cover
                              ),
                            )
                        ),onTap:(){
                      pr.show();
                      pr.hide().then((isHidden) {
                        print(isHidden);
                      });
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                      requestRegisterAPI(context, _fullnameController.text,_emailController.text, _passwordController.text);
                    }
                    )
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(120.0, 10.0, 0.0, 0.0),
                  child: Text("Daftar menggunakan", style: TextStyle(fontFamily:'Proxima_nova',fontSize: 18.0,
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
                      Text("Sudah punya akun?", style:
                      TextStyle(fontFamily:'Proxima_nova',fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w100, ),
                      ),

                      new InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed('/LoginScreen');
                        },
                        child:new Text("Login", style:
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
