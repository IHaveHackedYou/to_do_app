import 'package:flutter/material.dart';
import 'package:to_do_app/widgets.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 32.0,
          ),
          color: Color(0xFFF6F6F6),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 32.0,
                    ),
                    child: const Image(
                      image: AssetImage(
                          "assets/index.jpg"
                      ),
                    ),
                  ),
                  TaskCardWidget(
                    title: "Get Started!",
                    desc: "Hello User! Welcome to WHAT_TODO app, this is a default task that you can edit or delete to start using the app.",
                  ),
                  TaskCardWidget(),
                ],
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF7349FE),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Image(
                    image: AssetImage(
                      "assets/index.jpg",
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}