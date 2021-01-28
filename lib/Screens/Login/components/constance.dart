import 'package:flutter/material.dart';

Future pushRemove(BuildContext context, Widget page) {
  MaterialPageRoute pageroute = MaterialPageRoute(builder: (context) => page);
  Navigator.pushAndRemoveUntil(context, pageroute, (route) => false);
}

String route = 'http://172.18.64.17/coffee';
