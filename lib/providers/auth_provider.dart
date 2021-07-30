import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:registration_screen/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  Future<UserModel> login(String email, String password) async {
    try {
      var body = {
        'email': email,
        'password': password,
      };
      var response =
          await http.post(Uri.parse('https://reqres.in/api/login'), body: body);

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
