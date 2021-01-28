import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/Screens/Signup/components/or_divider.dart';
import 'package:flutter_auth/Screens/Signup/components/social_icon.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/utility/normal_dailog.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter/material.dart';

class Mato extends StatefulWidget {
  @override
  _MatoState createState() => _MatoState();
}

class _MatoState extends State<Mato> {
  String level, branch, name, username, phone, email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Text(
              ///"SIGNUP",
              //style: TextStyle(fontWeight: FontWeight.bold),
              //),
              // Row(

              //children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 0.03),
                  SvgPicture.asset(
                    "assets/icons/signup.svg",
                    height: 0.35,
                  ),
                  Center(
                    child: RoundedInputField(
                      hintText: "Your Username",
                      icon: Icons.account_box_outlined,
                      onChanged: (value) => username = value.trim(),
                    ),
                  ),
                  RoundedInputField(
                    hintText: "Your Email",
                    icon: Icons.email,
                    onChanged: (value) => email = value.trim(),
                  ),
                  RoundedPasswordField(
                    onChanged: (value) => password = value.trim(),
                  ),
                  RoundedInputField(
                    hintText: "Your Name",
                    icon: Icons.account_box,
                    onChanged: (value) => name = value.trim(),
                  ),
                  RoundedInputField(
                    hintText: "Your Phone",
                    icon: Icons.phone,
                    onChanged: (value) => phone = value.trim(),
                  ),
                  Text('Level'),
                  levelRadio(),
                  levelRadio1(),
                  levelRadio2(),
                  Text('Branch'),
                  branchRadio(),
                  branchRadio2(),
                  RoundedButton(
                    text: "SIGNUP",
                    press: () {
                      print(
                          'name = $name,username = $username,password =$password,phone = $phone,email = $email level =$level,branch = $branch');

                      if (name == null ||
                          name.isEmpty ||
                          username == null ||
                          username.isEmpty ||
                          password == null ||
                          password.isEmpty ||
                          phone == null ||
                          phone.isEmpty ||
                          //branch == null ||
                          //branch.isEmpty ||
                          //level == null ||
                          //level.isEmpty ||
                          email == null ||
                          email.isEmpty) {
                        print('กรุณากรอกให้ครบ');
                        normalDialog(context, 'กรุณากรอกให้ครบทุกช่อง');
                      } else if (level == null) {
                        normalDialog(context, 'โปรดเลือก level ของผู้สมัคร');
                      } else if (branch == null) {
                        normalDialog(context, 'โปรดเลือก branch ของผู้สมัคร');
                      } else {}
                    },
                  ),
                  SizedBox(height: 0.03),
                ],
              ),
            ],
            // ),
            //AlreadyHaveAnAccountCheck(
            //login: false,
            //press: () {
            //Navigator.push(
            //context,
            //MaterialPageRoute(
            //builder: (context) {
            //return LoginScreen();
            //},
            //),
            //);
            //},
            //),
            // OrDivider(),
            //Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            //children: <Widget>[
            //SocalIcon(
            //iconSrc: "assets/icons/facebook.svg",
            //press: () {},
            //),
            //SocalIcon(
            //iconSrc: "assets/icons/twitter.svg",
            //press: () {},
            //),
            //SocalIcon(
            //iconSrc: "assets/icons/google-plus.svg",
            //press: () {},
            //),
            //],
            //)
            //  ],
          ),
        ),
      ),
    );
  }

  Widget branchRadio2() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                    value: '2',
                    groupValue: branch,
                    onChanged: (value) {
                      setState(() {
                        branch = value;
                      });
                    }),
                Text('2'),
              ],
            ),
          ),
        ],
      );

  Widget levelRadio1() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                    value: 'user',
                    groupValue: level,
                    onChanged: (value) {
                      setState(() {
                        level = value;
                      });
                    }),
                Text('User'),
              ],
            ),
          ),
        ],
      );

  Widget levelRadio2() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                    value: 'manager',
                    groupValue: level,
                    onChanged: (value) {
                      setState(() {
                        level = value;
                      });
                    }),
                Text('Manager'),
              ],
            ),
          ),
        ],
      );

  Widget branchRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                    value: '1',
                    groupValue: branch,
                    onChanged: (value) {
                      setState(() {
                        branch = value;
                      });
                    }),
                Text('1'),
              ],
            ),
          ),
        ],
      );

  Widget levelRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                    value: 'admin',
                    groupValue: level,
                    onChanged: (value) {
                      setState(() {
                        level = value;
                      });
                    }),
                Text('Admin'),
              ],
            ),
          ),
        ],
      );
}
