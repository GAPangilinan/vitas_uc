import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:vitas_uc/vitasproject/view/constants.dart';
import 'package:vitas_uc/vitasproject/view/screens/sign_in.dart';

import '../../logger.dart';
// import 'package:vitas_uc/vitasproject/view/screens/register.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // final log = logger(LoadingScreen);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ///// log.e('Error message');
    Timer(Duration(seconds: 3), () => Get.to(SignIn())
        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (BuildContext context) => Register()))
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(62, 58, 57, 1),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          decoration: bgImage,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                // height: 300,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: bgSplash,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
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
}
