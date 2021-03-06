import "package:flutter/material.dart";
import 'package:to_do_app/screens/helper_screens.dart';
import 'package:to_do_app/services/auth.dart';


class SignIn extends StatefulWidget {
  final Function toggleView;

  const SignIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
        body: SafeArea(
            child: Container(
      padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
      child: Column(
        children: [
          // App Bar
          Container(
            padding: EdgeInsets.all(10),
            height: 70,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(40)),
            child: Row(
              children: [
                //Image(image: AssetImage("assets/index.jpg"), height: 40),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(2.0),
                    child: TextButton(
                      onPressed: () {
                        widget.toggleView();
                      },
                      child: SizedBox(
                        width: 80,
                        height: 100,
                        child: Row(
                          children: [
                            Text(
                              "Sign up",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 15.0),
                            ),
                            Icon(
                              Icons.person,
                              color: Theme.of(context).primaryColor,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    // Email field
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email,
                                color: Theme.of(context).colorScheme.primary),
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintText: "Email (xxx@xxx.com)",
                            fillColor: Theme.of(context).colorScheme.tertiary,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          validator: (val) =>
                              val!.isEmpty ? "Enter an email" : null,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20.0),
                          onChanged: (val) {
                            setState(() => email = val);
                          }),
                    ),
                    SizedBox(height: 20),
                    // Password field
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key_rounded,
                              color: Theme.of(context).colorScheme.primary),
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: "Password (min. 6 char)",
                          fillColor: Theme.of(context).colorScheme.tertiary,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        validator: (val) => val!.length < 6
                            ? "Password must min. 6 characters long"
                            : null,
                        obscureText: true,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20.0),
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error =
                                  "COULD NOT SIGN IN WITH THESE CREDENTIALS";
                              loading = false;
                            });
                          }
                        }
                      },
                      child: Icon(Icons.done,
                          color: Theme.of(context).primaryColor),
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).colorScheme.secondary),
                    ),
                    SizedBox(height: 12.0),
                    Text(error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0))
                  ],
                )),
          )
        ],
      ),
    )));
  }
}
