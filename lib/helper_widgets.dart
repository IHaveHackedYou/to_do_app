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

// class CustomTopBar extends StatelessWidget {
//   final String title;
//
//   const CustomTopBar({Key? key, required String this.title}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//           color: Color(0xF3000000), borderRadius: BorderRadius.circular(40)),
//       child: Row(
//         children: const [
//           Image(image: AssetImage("assets/index.jpg"), height: 40),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text("To do app",
//                   style: TextStyle(fontSize: 40.0, color: Color(0xFFFFFFFF))),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
