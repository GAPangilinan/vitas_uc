import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vitas_uc/vitasproject/view/bet/fight_betscreen.dart';
// import 'package:vitas_uc/vitasproject/view/models/vitasmodel.dart';
//import 'package:vitas_uc/vitasproject/services/auth.dart';
// import 'package:vitas_uc/vitasproject/services/database.dart';
import 'package:vitas_uc/vitasproject/view/screens/qrscanner_screen.dart';
import 'package:vitas_uc/vitasproject/view/screens/sign_in.dart';

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
          child: Container(
            height: MediaQuery.of(context).size.height * 1,
            // height: MediaQuery.of(context).size.height / 1.1,
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
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
                  // height: 120,
                  height: MediaQuery.of(context).size.height * 0.2,
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
                        'Coco Martin',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(102, 102, 102, 1),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      SizedBox(width: 225),
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
                    SizedBox(width: 180),
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
                          // width: 2.0,
                          width: MediaQuery.of(context).size.width / 200,
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
                          color: Color.fromRGBO(102, 102, 102, 1),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      SizedBox(width: 130),
                      Text(
                        'OPEN',
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
                          // width: 2.0,
                          width: MediaQuery.of(context).size.width / 200,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'MERON',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'VS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color.fromRGBO(102, 102, 102, 1),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'WALA',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3.0,
                          fontFamily: 'Roboto',
                        ),
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
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'BREED',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color.fromRGBO(102, 102, 102, 1),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Roundhed',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3.0,
                          fontFamily: 'Roboto',
                        ),
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
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    SizedBox(width: 1),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'OWNER',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color.fromRGBO(102, 102, 102, 1),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Ronald Marasigan',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3.0,
                          fontFamily: 'Roboto',
                        ),
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
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'BET',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color.fromRGBO(102, 102, 102, 1),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '100,000,000.00',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: InkWell(
                        child: Container(
                          // height: 150,
                          // width: 160,
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.height * 0.2,
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
                            FinalResultAmount: FinalResultAmount,
                            totalBalance: totalBalance,
                          ));
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: InkWell(
                        child: Container(
                          // height: 150,
                          // width: 160,
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.37,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/nfc icon.png'),
                            ),
                          ),
                        ),
                        onTap: () {
                          Get.to(FightBetScreen(
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
