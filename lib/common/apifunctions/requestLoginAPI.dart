import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mactiv_app_new/common/functions/saveCurrentLogin.dart';
import 'package:mactiv_app_new/common/functions/showDialogSingleButton.dart';
import 'dart:convert';
import 'package:mactiv_app_new/model/json/loginModel.dart';

Future<LoginModel> requestLoginAPI(BuildContext context, String email, String password) async {
  final url = "https://devmactiv.mybluemix.net/api/user/login";

  Map<String, String> body = {
    'email': email,
    'password': password,
  };

  Map<String, String> headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
  };

  final response = await http.post(
    url,
    headers: headers,
    body: body,
  );

  final responseJson = json.decode(response.body);

  if (response.statusCode == 200) {
    var user = new LoginModel.fromJson(responseJson['userData']);

    saveCurrentLogin(user, responseJson['token']);
    Navigator.of(context).pushReplacementNamed('/HomeScreen');

    return user;
  } else {
    showDialogSingleButton(context, "Unable to Login", responseJson['msg'], "OK");
    //showDialogSingleButton(context, "Unable to Login", "You may have supplied an invalid 'Username' /
    // 'Password' combination. Please try again or contact your support representative.", "OK");
    return null;
  }
}

