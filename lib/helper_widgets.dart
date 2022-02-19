import 'package:flutter/material.dart';

class TodoEntry extends StatelessWidget {
  final String title;
  final bool done;

  const TodoEntry({Key? key, required this.title, required this.done})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(1.0),
        child: Row(
          children: [Checkbox(value: done, onChanged: null),
          Text("Moin leute Trymacs hier!")],
        ));
  }
}
