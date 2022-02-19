import "package:flutter/material.dart";
import 'package:to_do_app/helper_widgets.dart';
import 'package:to_do_app/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color(0xF3000000), borderRadius: BorderRadius.circular(40)),
            child: Row(
              children: const [
                Image(image: AssetImage("assets/index.jpg"), height: 40),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("To do app",
                        style: TextStyle(fontSize: 40.0, color: Color(0xFFFFFFFF))),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: ElevatedButton(
              child: Text("Sign in anonymous"),
              onPressed: () async {
                dynamic result = await _auth.signInAnon();
                if(result == null){
                  print("error sigining in");
                }else{
                  print("signed in");
                  print(result.uid);
                }
              },
            ),
          )
        ],
      ),
    )));
  }
}
