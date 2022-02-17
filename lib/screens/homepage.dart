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
          ),
          color: Color(0xFFF6F6F6),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        bottom: 32.0, right: 250.0, top: 32.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: const AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Image(
                              image: AssetImage("assets/index.jpg"),
                              fit: BoxFit.cover,
                            ))),
                  ),
                  Expanded(
                      child: ListView(
                    children: [
                      TaskCardWidget(),
                      TaskCardWidget(),
                      TaskCardWidget(),
                      TaskCardWidget(
                          title: "Servus leude", desc: "Ich bin so cool"),
                      TaskCardWidget(),
                      TaskCardWidget(),
                    ],
                  ))
                ],
              ),
              Positioned(
                bottom: 24.0,
                right: 0.0,
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF7349FE),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: const AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Image(
                              image: AssetImage("assets/index.jpg"),
                              fit: BoxFit.cover,
                            ))),
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
