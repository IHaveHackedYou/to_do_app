import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMessage;

  const ErrorScreen({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50, right: 20, left: 20),
            child: Center(
              child: Column(
                children: [
                  Text("An error occurred", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  Text("Log: $errorMessage", style: TextStyle(fontSize: 20))
                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/5/56/Donald_Trump_official_portrait.jpg"))
        ],
      ),
    ));
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: SpinKitChasingDots(
          color: Theme.of(context).colorScheme.secondary,
          size: 50.0,
        ),
      ),
    );
  }
}
