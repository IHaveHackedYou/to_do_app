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
          children: [
            Checkbox(value: done, onChanged: null),
            Text("Moin leute Trymacs hier!")
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
