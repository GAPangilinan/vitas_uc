import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zxing/flutter_zxing.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vitas_uc/vitasproject/screens/cashin_betscreen.dart';
import 'package:vitas_uc/vitasproject/screens/cashin_homescreen.dart';
import 'package:vitas_uc/vitasproject/screens/cashout_betscreen.dart';
import 'package:vitas_uc/vitasproject/screens/cashout_homescreen.dart';
import 'package:vitas_uc/vitasproject/screens/fight_betscreen.dart';
import 'package:vitas_uc/vitasproject/screens/fight_homescreen.dart';
import 'package:vitas_uc/vitasproject/screens/sign_in.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final GlobalKey _globalKey = GlobalKey();
  QRViewController? controller;
  Barcode? result;

  void qr(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((event) {
      setState(() {
        result = event;
      });
    });
  }

  @override
  void dispose() {
    stopCameraProcessing();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(62, 58, 57, 1),
      appBar: AppBar(
        title: Text(
          'QRScanner',
        ),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.attach_money, color: Colors.white),
            label: Text('Bet Screen'),
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: () {
              route();
            },
          ),
          TextButton.icon(
            icon: Icon(Icons.logout, color: Colors.white),
            label: Text('Logout'),
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: () {
              logout(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 70),
              Container(
                height: 400,
                width: 400,
                child: QRView(
                  key: _globalKey,
                  onQRViewCreated: qr,
                  overlay: QrScannerOverlayShape(
                    borderColor: Theme.of(context).accentColor,
                    borderRadius: 8,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: MediaQuery.of(context).size.width * 0.8,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white24,
                  ),
                  child: (result != null)
                      ? Text('${result!.code}')
                      : Text(
                          'Scan a code',
                          maxLines: 3,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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

    Get.to(SignIn());
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('vitas')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('cashierstatus') == "Cash In") {
          Get.to(CashinBetScreen());
        } else if (documentSnapshot.get('cashierstatus') == "Cash Out") {
          Get.to(CashoutBetScreen());
        } else if (documentSnapshot.get('cashierstatus') == "Bet") {
          Get.to(FightBetScreen());
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }
}
