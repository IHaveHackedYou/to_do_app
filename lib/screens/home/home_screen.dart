import 'dart:ui';

import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/helper_widgets.dart';
import 'package:to_do_app/services/auth.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    List<TodoEntry> entries = <TodoEntry>[
      TodoEntry(title: "title", done: true),
      TodoEntry(title: "title", done: true)
    ];
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color(0xF3000000),
                borderRadius: BorderRadius.circular(40)),
            child: Row(
              children: [
                //Image(image: AssetImage("assets/index.jpg"), height: 40),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text("To do app",
                      style:
                          TextStyle(fontSize: 30.0, color: Color(0xFFFFFFFF))),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(2.0),
                    child: TextButton(
                      onPressed: () async{
                        await _auth.signOut();
                      },
                      child: Icon(
                        Icons.logout,
                        color: Color(0xFFFFFFFF),
                        size: 30,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return entries[index];
              },
            ),
          )
        ],
      ),
    )));
  }
}
