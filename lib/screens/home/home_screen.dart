import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/shared/shared_widgets.dart';
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
            height: 70,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(40)),
            child: Row(
              children: [
                //Image(image: AssetImage("assets/index.jpg"), height: 40),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text("To do app",
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Theme.of(context).primaryColor)),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(2.0),
                    child: TextButton(
                      onPressed: () async {
                        await _auth.signOut();
                      },
                      child: Icon(
                        Icons.logout,
                        color: Theme.of(context).primaryColor,
                        size: 30,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
              height: 20
          ),
          Expanded(
            child: ListView.builder(
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return entries[index];
              },
            ),
          ),
          //FloatingActionButton(onPressed: () => {}, )
        ],
      ),
    )));
  }
}
