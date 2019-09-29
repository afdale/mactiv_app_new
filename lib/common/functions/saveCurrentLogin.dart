import 'package:shared_preferences/shared_preferences.dart';
import 'package:mactiv_app_new/model/json/loginModel.dart';
import 'dart:convert';

saveCurrentLogin(LoginModel user, String token) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  await preferences.setString('userData', json.encode(user.toJson()));
  await preferences.setString('LastToken', token);
}