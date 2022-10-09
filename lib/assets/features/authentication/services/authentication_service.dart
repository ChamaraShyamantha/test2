import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:MedicShare/assets/features/home/screens/home_screen.dart';
import 'package:MedicShare/assets/global_variables.dart';
import 'package:MedicShare/assets/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:MedicShare/assets/utils.dart';
import 'package:MedicShare/assets/error_handler.dart';
import 'package:MedicShare/assets/providers/user_provider.dart';
//import 'package:medic/assets/common/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService {
  // sign up user
  void userSignUp({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required String address,
    required String contactNo,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        address: '',
        contactNo: null,
        type: '',
        token: '',
        cart: [],
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Thanks for signing up! Please login to the App',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // sign in user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          var decodedItem = jsonDecode(res.body);
          print(decodedItem);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          var testUser = User.fromJson(res.body);
          print(testUser.name.toString());
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          /*Navigator.pushNamedAndRemoveUntil(
            context,
           // BottomBar.routeName,
           HomeScreen.routeName,
            (route) => false,
          );*/
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // get user data
  void getUserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
