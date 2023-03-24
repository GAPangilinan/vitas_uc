import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vitas_uc/vitasproject/view/constants.dart';
import 'package:vitas_uc/vitasproject/view/screens/sign_in.dart';

import '../widgets/nfc_cashout_icon.dart';
import '../widgets/qr_icon.dart';

class CashoutHomeScreen extends StatelessWidget {
  String cashierstatus = 'CASH OUT';
  double cashiermoney = 1000000;

  //final AuthService _auth = AuthService();
  String? fullName;
  String? passwordc1;
  String? passwordc2;
  String? passwordc3;
  int? FinalResultAmount;
  int? totalBalance;
  CashoutHomeScreen({
    this.fullName,
    this.passwordc1,
    this.passwordc2,
    this.passwordc3,
    this.FinalResultAmount,
    this.totalBalance,
  });

  @override
  Widget build(BuildContext context) {
    // return StreamProvider<List<VitasModel>?>.value(
    //   initialData: null,
    //   value: DatabaseService(uid: '').vitas,
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(62, 58, 57, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          //BACKGROUND IMAGE
          child: Container(
            height: MediaQuery.of(context).size.height * 1,
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
            decoration: bgImage,
            child: Column(
              children: <Widget>[
                SizedBox(height: 0),
                //LOGO
                Container(
                  // height: 120,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: bgLogo,
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    children: <Widget>[
                      //CASHIER HEADER
                      Text(
                        //fullName!,
                        'Gilmer Pangilinan',
                        style: cnHeaderTextStyle,
                      ),
                      SizedBox(width: 160),
                      IconButton(
                        icon: Icon(Icons.login_rounded),
                        iconSize: 30,
                        color: Colors.grey[700],
                        onPressed: () {
                          //logout(context);
                          Get.to(SignIn(
                              passwordc1: passwordc1,
                              passwordc2: passwordc2,
                              passwordc3: passwordc3));
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 0),
                //CASHIER HEADER TEXT & AMOUNT
                Row(
                  children: <Widget>[
                    Text(
                      'Cashier',
                      style: ctaHeaderTextStyle,
                    ),
                    SizedBox(width: 160),
                    Text(
                      NumberFormat('#,###.00#', 'en-US').format(cashiermoney),
                      style: ctaHeaderTextStyle,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                //BLUE-BORDER LINE
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container(
                    decoration: bbDecoration,
                  ),
                ),
                SizedBox(height: 10),
                //GREEN CASH OUT TEXT
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        cashierstatus,
                        style: GreenTextStyle,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                //BLUE-BORDER LINE
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container(
                    decoration: bbDecoration,
                  ),
                ),
                SizedBox(height: 10),
                //CASH-OUT INFORMATION
                Row(
                  children: [
                    Text(
                      'Important:',
                      style: infoTextStyle,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'By using this cash out facility, you agree that the amount will be debited from your card with minimum fee of (50.00).',
                  textAlign: TextAlign.justify,
                  style: infoTextStyle,
                ),
                SizedBox(height: 10),
                Text(
                  'Upon confirmation of the transaction, the amount debited from the card is non refundable and can not be reversed.',
                  textAlign: TextAlign.justify,
                  style: infoTextStyle,
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //QR ICON BUTTON
                    QRiconButton(
                      cashierstatus: cashierstatus,
                      fullName: fullName,
                      passwordc1: passwordc1,
                      passwordc2: passwordc2,
                      passwordc3: passwordc3,
                      totalBalance: totalBalance,
                      FinalResultAmount: FinalResultAmount,
                    ),
                    SizedBox(width: 10),
                    //NFC ICON BUTTON
                    NFCCashoutIconButton(
                      fullName: fullName,
                      passwordc1: passwordc1,
                      passwordc2: passwordc2,
                      passwordc3: passwordc3,
                      totalBalance: totalBalance,
                      FinalResultAmount: FinalResultAmount,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // );
  }

/*
  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => SignIn(),
    //   ),
    // );

    Get.to(SignIn(
        passwordc1: passwordc1,
        passwordc2: passwordc2,
        passwordc3: passwordc3));
  }
  */
}
