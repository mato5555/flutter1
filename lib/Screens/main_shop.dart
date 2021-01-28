import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Signup/components/body.dart';
import 'package:flutter_auth/Screens/Welcome/components/body.dart';

class MainShop extends StatefulWidget {
  @override
  _MainShopState createState() => _MainShopState();
}

class _MainShopState extends State<MainShop> {
  Widget signUpButton() {
    return RaisedButton(
      child: Text('Register'),
      onPressed: () {
        print('Click');

        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => Mato());
        
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  Widget showBotton() {
    return Row(
      children: <Widget>[
        signUpButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ADMIN'),
        ),
        drawer: showDrawer(),
        
        //body: Column(
          //children: [showBotton()],
        //)
        );
  }

  Drawer showDrawer() => Drawer(child: ListView(
    children: <Widget>[showHeader(),
    signinMenu()],
  ),);

  ListTile signinMenu() => ListTile(leading: Icon(Icons.account_box),title: Text('Register') ,onTap: () {
    Navigator.pop(context);
    MaterialPageRoute route =
            MaterialPageRoute(builder:   (Value) => Mato());
            
  Navigator.of(context).push(route);
    
  },);

  UserAccountsDrawerHeader showHeader() => UserAccountsDrawerHeader(accountName: Text('Hi!'), accountEmail: Text('You Are Admin'));
}
