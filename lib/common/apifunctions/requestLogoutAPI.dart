import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:mactiv_app_new/common/functions/getToken.dart';
import 'package:mactiv_app_new/common/functions/saveLogout.dart';
import 'package:mactiv_app_new/model/json/loginModel.dart';

Future<LoginModel> requestLogoutAPI(BuildContext context) async {
  final url = "https://devmactiv.mybluemix.net/api/user/logout";

  var token;

  await getToken().then((result) {
    token = result;
  });

  Map<String, String> headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'token': token,
  };

  final response = await http.get(
    url,
    headers: headers,
  );

  if (response.statusCode == 200) {
    saveLogout();
    return null;
  } else {
    return null;
  }
}