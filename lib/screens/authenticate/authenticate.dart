import "package:flutter/material.dart";
import 'package:to_do_app/screens/authenticate/sign_in.dart';

import '../home/home_screen.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignIn()
    );
  }
}
