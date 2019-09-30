import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mactiv_app_new/common/functions/showDialogSingleButton.dart';

Future<void> requestRegisterAPI(BuildContext context, String fullname, String email, String password) async {
  final url = "https://devmactiv.mybluemix.net/api/user/register";

  Map<String, String> body = {
    'name': fullname,
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

  if (response.statusCode == 201) {

    Navigator.of(context).pushReplacementNamed('/LoginScreen');

  } else {
    showDialogSingleButton(context, "Unable to Register", responseJson['msg'], "OK");
    //showDialogSingleButton(context, "Unable to Login", "You may have supplied an invalid 'Username' /
    // 'Password' combination. Please try again or contact your support representative.", "OK");
    return null;
  }
}

