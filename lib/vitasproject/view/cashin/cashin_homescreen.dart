import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vitas_uc/vitasproject/view/cashin/cashin_betscreen.dart';
import 'package:vitas_uc/vitasproject/view/cashout/cashout_betscreen.dart';
import 'package:vitas_uc/vitasproject/view/constants.dart';

import 'package:vitas_uc/vitasproject/view/screens/qrscanner_screen.dart';
import 'package:vitas_uc/vitasproject/view/screens/sign_in.dart';
import 'package:vitas_uc/vitasproject/view/widgets/nfc_cashin_icon.dart';
import 'package:vitas_uc/vitasproject/view/widgets/nfc_reader.dart';
import 'package:vitas_uc/vitasproject/view/widgets/qr_icon.dart';

class CashinHomeScreen extends StatelessWidget {
  //final AuthService _auth = AuthService();
  String? fullName;
  String? passwordc1;
  String? passwordc2;
  String? passwordc3;
  int? totalBalance;
  int? FinalResultAmount;
  CashinHomeScreen(
      {this.fullName,
      this.passwordc1,
      this.passwordc2,
      this.passwordc3,
      this.totalBalance,
      this.FinalResultAmount});
  String cashierstatus = 'CASH IN';
  int cashiermoney = 1000000;

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
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
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
                //CASHIER NAME
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        //fullName!,
                        'Juan Dela Cruz',
                        style: cnHeaderTextStyle,
                      ),
                      SizedBox(width: 153),
                      //SIGN-OUT ICON
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
                Row(
                  children: <Widget>[
                    //CASHIER TEXT
                    Text(
                      'Cashier',
                      style: ctaHeaderTextStyle,
                    ),
                    SizedBox(width: 160),
                    //CASHIER AMOUNT
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    children: [
                      //GREEN CASH IN TEXT
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
                //CASH-IN INFORMATION
                SizedBox(height: 10),
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
                  'By using this cash in facility, you agree that the amount will be credited to your card with a minimum fee of (0.00).',
                  textAlign: TextAlign.justify,
                  style: infoTextStyle,
                ),
                SizedBox(height: 10),
                Text(
                  'Upon confirmation of the transaction, the amount credited to the card is non refundable and can not be reversed.',
                  textAlign: TextAlign.justify,
                  style: infoTextStyle,
                ),
                SizedBox(height: 10),
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
                    NFCCashinIconButton(
                      fullName: fullName,
                      passwordc1: passwordc1,
                      passwordc2: passwordc2,
                      passwordc3: passwordc3,
                      totalBalance: totalBalance,
                      FinalResultAmount: FinalResultAmount,
                    ),
                    // NFCReader(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    //);
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
