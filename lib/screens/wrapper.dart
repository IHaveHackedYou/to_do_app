import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:to_do_app/model/user.dart';
import 'package:to_do_app/screens/authenticate/authenticate.dart';
import 'package:to_do_app/screens/home/home_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // get data from main.dart the StreamProvider the value: AuthService().user
    // get current user state
    final user = Provider.of<CustomUser?>(context);
    // return either Home or Authenticate widget
    if(user == null){
      return Authenticate();
    }else{
      return HomeScreen();
    }
  }
}
