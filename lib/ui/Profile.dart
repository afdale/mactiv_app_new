import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child:

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
                  Navigator.of(context).pushReplacementNamed('/LoginScreen');
                },
                child: Center(
                  child: const Text('Login', style: TextStyle
                    (fontFamily:'Proxima_nova', fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold)),
                )),
          ),
        ),
      ),
    );
  }
}
