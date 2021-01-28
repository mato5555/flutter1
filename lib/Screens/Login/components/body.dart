import 'dart:convert';
//import 'dart:js';
//import 'dart:js';
//import 'dart:js';
//import 'dart:js';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Login/components/constance.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/main_shop.dart';
import 'package:flutter_auth/Screens/main_user.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/main_manager.dart';
import 'package:flutter_auth/model/user_model.dart';
import 'package:flutter_svg/svg.dart';

class BodyPage extends StatefulWidget {
  BodyPage({Key key}) : super(key: key);
  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  String username, password;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future checkAuthen() async {
    String url =
        '$route/getUserWhereUserMaster.php?isAdd=true&Username=$username';
    try {
      print("login  xxxxxxxxxxxxxxxxx");
      Response response = await Dio().get(url);
      print(response.statusCode);
      print('res = $response');
      var result = json.decode(response.data);
      print('result = $result');
      for (var map in result) {
        UserModel userModel = UserModel.fromJson(map);
        if (password == userModel.password) {
          String level = userModel.level;
          if (level == 'user') {
            print('user');
            pushRemove(context, MainUser());
          } else if (level == 'admin') {
            //routeToService( context, MainUser());
            print('admin');
            pushRemove(context, MainShop());
            } else if (level == 'manager') {
            //routeToService( context, MainUser());
            print('manager');
            pushRemove(context, MainManager());
          } else {}
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "LOGIN",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: Color(0xFFD81B60),
                  fontStyle: FontStyle.italic,
                  fontFamily: 'PottaOne',
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/login.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your User",
              onChanged: (value) => username = value.trim(),
              //onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) => password = value.trim(),
              //onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                if (username == null ||
                    username.isEmpty ||
                    password == null ||
                    password.isEmpty) {
                  //buildNormalDialog(context);
                } else {
                  checkAuthen();
                }
              },
            ),
            //SizedBox(height: size.height * 0.03),
            //AlreadyHaveAnAccountCheck(
              //press: () {
                //Navigator.push(
                  //context,
                  //MaterialPageRoute(
                    //builder: (context) {
                      //return SignUpScreen();
                    //},
                  //)//,
                //);
              //},
            //),
          ],
        ),
      ),
    );
  }
}

/*

class BodyPage extends StatelessWidget {
  String Username, Password;

  //BuildContext get context => null;
  //Field

  @override
  Future<Null> checkAuthen() async {
    String url =
        'http://192.168.1.1/coffee/getUserWhereUserMaster.php?isAdd=true&Username=$Username';
    try {
      Response response = await Dio().get(url);
      print('res = $response');
      var result = json.decode(response.data);
      print('result = $result');
      for (var map in result) {
        UserModel userModel = UserModel.fromJson(map);
        if (Password == userModel.password) {
          String Level = userModel.level;
          if (Level == 'user') {
            routeToService(context, MainUser());
          } else if (Level == 'admin') {
            //routeToService( context, MainUser());
            routeToService(context, MainUser());
        } else {}
      }
    } catch (e) {}
  }

  void routeToService(BuildContext context, Widget myWidget) {
    MaterialPageRoute route = MaterialPageRoute(builder: (context) => myWidget);

    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "LOGIN",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: Color(0xFFD81B60),
                  fontStyle: FontStyle.italic,
                  fontFamily: 'PottaOne',
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/login.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your User",
              onChanged: (value) => Username = value.trim(),
              //onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) => Password = value.trim(),
              //onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                if (Username == null ||
                    Username.isEmpty ||
                    Password == null ||
                    Password.isEmpty) {
                  //buildNormalDialog(context);
                } else {}
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

*/
