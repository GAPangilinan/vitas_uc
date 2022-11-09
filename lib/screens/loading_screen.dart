import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:vitas/screens/authenticate/sign_in.dart';
import 'package:vitas/screens/loading_screen.dart';
import 'package:vitas/services/loading_auth.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => AuthLoadingService())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(62, 58, 57, 1),
      body: SafeArea(
        child: Container(
          decoration: Background(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300,
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('assets/splash.png')),
                ),
              ),
              SizedBox(height: 30),
              LinearPercentIndicator(
                animation: true,
                animationDuration: 2770,
                lineHeight: 3,
                percent: 1,
                progressColor: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration Background() {
    return BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/background.jpg'), fit: BoxFit.cover),
    );
  }
}
