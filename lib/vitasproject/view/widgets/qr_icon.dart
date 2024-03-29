import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vitas_uc/vitasproject/view/constants.dart';

import '../screens/qrscanner_screen.dart';

class QRiconButton extends StatelessWidget {
  String? cashierstatus;
  String? fullName;
  String? passwordc1;
  String? passwordc2;
  String? passwordc3;
  int? totalBalance;
  int? FinalResultAmount;
  QRiconButton(
      {this.cashierstatus,
      this.fullName,
      this.passwordc1,
      this.passwordc2,
      this.passwordc3,
      this.totalBalance,
      this.FinalResultAmount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: InkWell(
        child: Container(
          // height: 150,
          // width: 160,
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.3,
          decoration: qrIcon,
        ),
        onTap: () {
          Get.to(QRScannerScreen(
            cashierstatus: cashierstatus,
            fullName: fullName,
            passwordc1: passwordc1,
            passwordc2: passwordc2,
            passwordc3: passwordc3,
            totalBalance: totalBalance,
            FinalResultAmount: FinalResultAmount,
          ));
        },
      ),
    );
  }
}
