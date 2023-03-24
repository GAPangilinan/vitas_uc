import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vitas_uc/vitasproject/view/constants.dart';
import 'package:vitas_uc/vitasproject/view/screens/sign_in.dart';

import '../widgets/nfc_bet_icon.dart';
import '../widgets/qr_icon.dart';

class FightHomeScreen extends StatelessWidget {
  //const HomeScreen({super.key});
  String cashierstatus = 'FIGHT NO: 1';

  //final AuthService _auth = AuthService();
  String? fullName;
  String? passwordc1;
  String? passwordc2;
  String? passwordc3;
  int? FinalResultAmount;
  int? totalBalance;
  FightHomeScreen({
    this.fullName,
    this.passwordc1,
    this.passwordc2,
    this.passwordc3,
    this.FinalResultAmount,
    this.totalBalance,
  });

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
                      //CASHIER NAME & SIGN-OUT ICON HEADER
                      Text(
                        //fullName!,
                        'Coco Martin',
                        style: cnHeaderTextStyle,
                      ),
                      SizedBox(width: 205),
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
                //CASHIER TEXT & AMOUNT HEADER
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
                //GREEN OPEN TEXT
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        cashierstatus,
                        style: fTextStyle,
                      ),
                      SizedBox(width: 160),
                      Text(
                        'OPEN',
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
                //BET INFORMATION
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'MERON',
                        textAlign: TextAlign.left,
                        style: mLeftInfoTextStyle,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'VS',
                        textAlign: TextAlign.center,
                        style: middleBetInfoStextStyle,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'WALA',
                        textAlign: TextAlign.right,
                        style: wRightInfoTextStyle,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Talisayin',
                        textAlign: TextAlign.left,
                        style: wBetInfoTextStyle,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'BREED',
                        textAlign: TextAlign.center,
                        style: middleBetInfoStextStyle,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Roundhed',
                        textAlign: TextAlign.right,
                        style: wBetInfoTextStyle,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Pedro Martinez',
                        textAlign: TextAlign.left,
                        style: wBetInfoTextStyle,
                      ),
                    ),
                    SizedBox(width: 1),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'OWNER',
                        textAlign: TextAlign.center,
                        style: middleBetInfoStextStyle,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Ronald Marasigan',
                        textAlign: TextAlign.right,
                        style: wBetInfoTextStyle,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        '100,000,000.00',
                        textAlign: TextAlign.left,
                        style: mLeftInfoTextStyle,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'BET',
                        textAlign: TextAlign.center,
                        style: middleBetInfoStextStyle,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '100,000,000.00',
                        textAlign: TextAlign.right,
                        style: wRightInfoTextStyle,
                      ),
                    ),
                  ],
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
                    NFCBetIconButton(
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
    //);
  }

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
        passwordc1: passwordc2,
        passwordc2: passwordc2,
        passwordc3: passwordc3));
  }
}
