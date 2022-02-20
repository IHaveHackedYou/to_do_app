import "package:cloud_firestore/cloud_firestore.dart";

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final FirebaseFirestore todoCollection = FirebaseFirestore.instance
      .collection("todo") as FirebaseFirestore;

  Future updateUserData() async{
    return await todoCollection.doc(uid).set({
    });
  }
}