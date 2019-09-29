import 'package:shared_preferences/shared_preferences.dart';
import 'package:mactiv_app_new/model/json/loginModel.dart';
import 'dart:convert';

getUser() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  String userData = await preferences.getString("userData");
  LoginModel user = new LoginModel.fromJson(json.decode(userData));
  return user;
}