import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/screens/helper_screens.dart';
import 'package:to_do_app/screens/home_screen.dart';


Future<void> main() async{
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
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme
        )
      ),
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot){
          if(snapshot.hasError){
            print("error while initalizing firebase! ${snapshot.error.toString()}");
            return ErrorScreen(errorMessage: snapshot.error.toString());
          }else if (snapshot.hasData){
            return HomeScreen();
          }else{
            return LoadingScreen();
          }
        }
      )
    );
  }
}