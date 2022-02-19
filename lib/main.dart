import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/screens/helper_screens.dart';
import 'package:to_do_app/screens/wrapper.dart';
import 'package:to_do_app/services/auth.dart';

import 'model/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            // change font family
            textTheme:
                GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)),
        // Future Builder is waiting for Firebase to initialize
        home: FutureBuilder(
            future: _fbApp,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(
                    "error while initalizing firebase! ${snapshot.error.toString()}");
                return ErrorScreen(errorMessage: snapshot.error.toString());
              } else if (snapshot.hasData) {
                return StreamProvider<CustomUser>.value(
                    initialData: CustomUser(uid: "null"),
                    // listen to stream AuthService().user
                    // update Wrapper() whenever user state changes (e.g. logged in/out)
                    value: AuthService().user,
                    child: Wrapper());
              } else {
                return LoadingScreen();
              }
            }));
  }
}
