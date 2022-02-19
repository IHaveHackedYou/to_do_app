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
        theme: darkTheme(),
        // Future Builder is waiting for Firebase to initialize
        home: FutureBuilder(
            future: _fbApp,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(
                    "error while initalizing firebase! ${snapshot.error.toString()}");
                return ErrorScreen(errorMessage: snapshot.error.toString());
              } else if (snapshot.hasData) {
                return StreamProvider<CustomUser?>.value(
                    initialData: null,
                    // listen to stream AuthService().user
                    // update Wrapper() whenever user state changes (e.g. logged in/out)
                    value: AuthService().user,
                    child: Wrapper());
              } else {
                return LoadingScreen();
              }
            }));
  }

  ThemeData darkTheme(){
    final baseTheme = ThemeData.dark();
    return baseTheme.copyWith(
      textTheme: GoogleFonts.robotoTextTheme(),
      scaffoldBackgroundColor: Color(0xFF000000),
      primaryColor: Color(0xFFFFFFFF),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Color(0xFF000000),
        secondary: Color(0xFFFF8400),
        tertiary: Color(0xFF404040),
        shadow: Color(0xFF1C1C1C),
        outline: Color(0xE6FF8400),
        errorContainer: Color(0xFF000000)
      )
    );
  }
}
