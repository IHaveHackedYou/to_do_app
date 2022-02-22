import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:to_do_app/services/database.dart';

class TodoEntriesList extends StatelessWidget {
  const TodoEntriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService(uid: "fj").todo,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return "d"
          },
        )
    );
  }
}
