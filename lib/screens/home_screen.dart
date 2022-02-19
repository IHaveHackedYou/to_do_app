import 'dart:ui';

import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/helper_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Color(0xF3000000),
                borderRadius: BorderRadius.circular(40)),
            child: Row(
              children: [
                Image(image: AssetImage("assets/index.jpg"), height: 60),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("To do app",
                        style: TextStyle(
                             fontSize: 40.0, color: Color(
                            0xFFFFFFFF))),
                  ),
                ),
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
