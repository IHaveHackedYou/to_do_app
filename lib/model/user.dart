import 'package:to_do_app/model/todo_entry.dart';

class CustomUser{
  final String uid;
  final String? name;
  List<TodoEntry> todos = List.empty(growable: true);

  CustomUser({required this.uid, this.name});
}