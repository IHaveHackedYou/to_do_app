import "package:flutter/material.dart";

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    child: Text("Add entry",
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold)),
                  ),
                  // Expanded(
                  //   child: Container(
                  //     alignment: Alignment.centerRight,
                  //     padding: EdgeInsets.all(2.0),
                  //     child: TextButton(
                  //       onPressed: () async {
                  //         await _auth.signOut();
                  //       },
                  //       child: Icon(
                  //         Icons.logout,
                  //         color: Theme.of(context).primaryColor,
                  //         size: 30,
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
            SizedBox(height: 20),
            TextField(
                decoration: InputDecoration(
                  //prefixIcon: Icon(Icons.email,
                  //color: Theme.of(context).colorScheme.primary),
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "to do",
                  fillColor: Theme.of(context).colorScheme.tertiary,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 20.0),
                onChanged: (val) {}),
            Row(
              children: [
                // save to_do
                ElevatedButton(
                  onPressed: ()  {

                  },
                  child: Icon(Icons.done,
                      color: Theme.of(context).primaryColor),
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.secondary),
                ),
                // abort to_do
                ElevatedButton(
                  onPressed: ()  {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.stop,
                      color: Theme.of(context).primaryColor),
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.secondary),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
