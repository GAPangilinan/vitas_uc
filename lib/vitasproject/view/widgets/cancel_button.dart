import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../cashin/cashin_homescreen.dart';

class CancelButton extends StatelessWidget {
  String? passwordc1;
  String? passwordc2;
  String? passwordc3;
  String? fullName;
  int? FinalResultAmount;
  int? totalBalance;
  CancelButton(
      {this.passwordc1,
      this.passwordc2,
      this.passwordc3,
      this.fullName,
      this.FinalResultAmount,
      this.totalBalance});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        minWidth: 185,
        elevation: 100,
        // height: 53,
        height: MediaQuery.of(context).size.height / 15,
        onPressed: () async {
          //route();
          FinalResultAmount = 0;
          Get.to(CashinHomeScreen(
            fullName: fullName,
            passwordc1: passwordc1,
            passwordc2: passwordc2,
            passwordc3: passwordc3,
            FinalResultAmount: FinalResultAmount,
            totalBalance: totalBalance,
          ));
        },
        child: Text(
          'CANCEL',
          style: TextStyle(
            letterSpacing: 2.0,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        color: Color.fromRGBO(67, 67, 67, 1),
      ),
    );
  }
}
