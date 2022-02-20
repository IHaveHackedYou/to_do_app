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
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          children: [
            Checkbox(
              value: done,
              onChanged: null,
              checkColor: Color(0xFFFFFFFF),
              //fillColor: MaterialStateProperty<Color?>,
            ),
            Text(title,
                style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20))
          ],
        ));
  }
}


