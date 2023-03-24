import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cashout/cashout_betscreen.dart';

class NFCCashoutIconButton extends StatelessWidget {
  String? fullName;
  String? passwordc1;
  String? passwordc2;
  String? passwordc3;
  int? totalBalance;
  int? FinalResultAmount;
  NFCCashoutIconButton(
      {this.fullName,
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
          width: MediaQuery.of(context).size.width * 0.37,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/nfc icon.png'),
            ),
          ),
        ),
        onTap: () {
          Get.to(CashoutBetScreen(
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
