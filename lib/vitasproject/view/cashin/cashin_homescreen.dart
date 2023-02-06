import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vitas_uc/vitasproject/view/cashin/cashin_betscreen.dart';
import 'package:vitas_uc/vitasproject/view/cashout/cashout_betscreen.dart';
// import 'package:vitas_uc/vitasproject/view/models/vitasmodel.dart';
//import 'package:vitas_uc/vitasproject/services/auth.dart';
// import 'package:vitas_uc/vitasproject/services/database.dart';
import 'package:vitas_uc/vitasproject/view/screens/qrscanner_screen.dart';
import 'package:vitas_uc/vitasproject/view/screens/sign_in.dart';

class CashinHomeScreen extends StatelessWidget {
  //const HomeScreen({super.key});

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
          child: Container(
            height: MediaQuery.of(context).size.height * 1,
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 0),
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo.png'),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        //fullName!,
                        'Juan Dela Cruz',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(102, 102, 102, 1),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      SizedBox(width: 154),
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
                    Text(
                      'Cashier',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(102, 102, 102, 1),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    SizedBox(width: 130),
                    Text(
                      NumberFormat('#,###.00#', 'en-US').format(cashiermoney),
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(102, 102, 102, 1),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.blueAccent,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        cashierstatus,
                        style: TextStyle(
                          fontSize: 19,
                          color: Color.fromRGBO(54, 191, 54, 1),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.blueAccent,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Important:',
                      //textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(102, 102, 102, 1),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'By using this cash in facility, you agree that the amount will be credited to your card with a minimum fee of (0.00).',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 10,
                    color: Color.fromRGBO(102, 102, 102, 1),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.0,
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Upon confirmation of the transaction, the amount credited to the card is non refundable and can not be reversed.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 10,
                    color: Color.fromRGBO(102, 102, 102, 1),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.0,
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: InkWell(
                        child: Container(
                          height: 150,
                          width: 160,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/qr icon.png'),
                            ),
                          ),
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
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: InkWell(
                        child: Container(
                          height: 150,
                          width: 160,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/nfc icon.png'),
                            ),
                          ),
                        ),
                        onTap: () {
                          Get.to(CashinBetScreen(
                              passwordc1: passwordc1,
                              passwordc2: passwordc2,
                              passwordc3: passwordc3));
                        },
                      ),
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
