import "package:cloud_firestore/cloud_firestore.dart";
import 'package:to_do_app/model/todo_entry.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  final List<TodoEntry> _todoEntries = List.empty(growable: true);

  final FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  Future updateUserData(List<TodoEntry> entries) async{
    for (int i = 0; i<entries.length; i++) {
      _updateUserData(entries[i].title, entries[i].checked, 1);
    }
  }


  Future _updateUserData(String title,bool checked, int index) async{
    return await firestoreInstance.collection("todo").doc(uid).collection("single entry").doc(index.toString()).set({
      "title" : title,
      "checked" : checked
    });
  }

  Future getUserData()async{

  }

  Stream<QuerySnapshot> get todo{
    return firestoreInstance.collection("todo").snapshots();
  }

  void addToDoEntry(TodoEntry todoEntry)=> _todoEntries.add(todoEntry);

  List<TodoEntry> getTodoEntries() => _todoEntries;

}