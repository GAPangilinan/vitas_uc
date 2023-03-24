import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vitas_uc/vitasproject/view/cashin/cashin_betscreen.dart';
import 'package:vitas_uc/vitasproject/view/cashin/cashin_homescreen.dart';
import 'package:vitas_uc/vitasproject/view/cashout/cashout_betscreen.dart';
import 'package:vitas_uc/vitasproject/view/bet/fight_betscreen.dart';

class QRScannerScreen extends StatefulWidget {
  String? fullName;
  String? cashierstatus;
  String? passwordc1;
  String? passwordc2;
  String? passwordc3;
  int? totalBalance;
  int? FinalResultAmount;
  QRScannerScreen(
      {this.cashierstatus,
      this.fullName,
      this.passwordc1,
      this.passwordc2,
      this.passwordc3,
      this.totalBalance,
      this.FinalResultAmount});

  @override
  State<StatefulWidget> createState() => _QRScannerScreenState(
      cashierstatus,
      fullName,
      passwordc1,
      passwordc2,
      passwordc3,
      totalBalance,
      FinalResultAmount);
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  String? fullName;
  String? cashierstatus;
  String? passwordc1;
  String? passwordc2;
  String? passwordc3;
  int? totalBalance;
  int? FinalResultAmount;
  _QRScannerScreenState(
      this.cashierstatus,
      this.fullName,
      this.passwordc1,
      this.passwordc2,
      this.passwordc3,
      this.totalBalance,
      this.FinalResultAmount);

  Barcode? result;
  String? resultcode;

  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey();

  void _onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((scanData) {
      print(cashierstatus);
      setState(() {
        result = scanData;
        if (cashierstatus == 'CASH IN') {
          if (result!.code == '7019-4889-5501-4231') {
            resultcode = result!.code;
            Get.to(CashinBetScreen(
              resultcode: resultcode,
              fullName: fullName,
              passwordc1: passwordc1,
              passwordc2: passwordc2,
              passwordc3: passwordc3,
              totalBalance: totalBalance,
              FinalResultAmount: FinalResultAmount,
            ));
          } else if (result!.code == '6980-7001-5563-4089') {
            resultcode = result!.code;
            Get.to(CashinBetScreen(
              resultcode: resultcode,
              fullName: fullName,
              passwordc1: passwordc1,
              passwordc2: passwordc2,
              passwordc3: passwordc3,
              FinalResultAmount: FinalResultAmount,
              totalBalance: totalBalance,
            ));
          } else if (result!.code == '6819-5619-7287-4123') {
            resultcode = result!.code;
            Get.to(CashinBetScreen(
              resultcode: resultcode,
              fullName: fullName,
              passwordc1: passwordc1,
              passwordc2: passwordc2,
              passwordc3: passwordc3,
              FinalResultAmount: FinalResultAmount,
              totalBalance: totalBalance,
            ));
          } else {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  icon: Icon(Icons.security),
                  title: Text('Unrecognized Card'),
                  content: Text(
                      'The QR or NFC you are trying to read is unrecognized. Please check and try again or contact support on'),
                  actions: [
                    TextButton(
                      child: Text('Ok'),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                );
              },
            );
          }
        } else if (cashierstatus == 'CASH OUT') {
          if (result!.code == '7019-4889-5501-4231') {
            resultcode = result!.code;
            Get.to(CashoutBetScreen(
              resultcode: resultcode,
              fullName: fullName,
              passwordc1: passwordc1,
              passwordc2: passwordc2,
              passwordc3: passwordc3,
              FinalResultAmount: FinalResultAmount,
              totalBalance: totalBalance,
            ));
          } else if (result!.code == '6980-7001-5563-4089') {
            resultcode = result!.code;
            Get.to(CashoutBetScreen(
              resultcode: resultcode,
              fullName: fullName,
              passwordc1: passwordc1,
              passwordc2: passwordc2,
              passwordc3: passwordc3,
              FinalResultAmount: FinalResultAmount,
              totalBalance: totalBalance,
            ));
          } else if (result!.code == '6819-5619-7287-4123') {
            resultcode = result!.code;
            Get.to(CashoutBetScreen(
              resultcode: resultcode,
              fullName: fullName,
              passwordc1: passwordc1,
              passwordc2: passwordc2,
              passwordc3: passwordc3,
              FinalResultAmount: FinalResultAmount,
              totalBalance: totalBalance,
            ));
          } else {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  icon: Icon(Icons.security),
                  title: Text('Unrecognized Card'),
                  content: Text(
                      'The QR or NFC you are trying to read is unrecognized. Please check and try again or contact support on'),
                  actions: [
                    TextButton(
                      child: Text('Ok'),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                );
              },
            );
          }
        } else if (cashierstatus == 'FIGHT NO: 1') {
          if (result!.code == '7019-4889-5501-4231') {
            resultcode = result!.code;
            Get.to(FightBetScreen(
              resultcode: resultcode,
              fullName: fullName,
              passwordc1: passwordc1,
              passwordc2: passwordc2,
              passwordc3: passwordc3,
              FinalResultAmount: FinalResultAmount,
              totalBalance: totalBalance,
            ));
          } else if (result!.code == '6980-7001-5563-4089') {
            resultcode = result!.code;
            Get.to(FightBetScreen(
              resultcode: resultcode,
              fullName: fullName,
              passwordc1: passwordc1,
              passwordc2: passwordc2,
              passwordc3: passwordc3,
              FinalResultAmount: FinalResultAmount,
              totalBalance: totalBalance,
            ));
          } else if (result!.code == '6819-5619-7287-4123') {
            resultcode = result!.code;
            Get.to(FightBetScreen(
              resultcode: resultcode,
              fullName: fullName,
              passwordc1: passwordc1,
              passwordc2: passwordc2,
              passwordc3: passwordc3,
              FinalResultAmount: FinalResultAmount,
              totalBalance: totalBalance,
            ));
          } else {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  icon: Icon(Icons.security),
                  title: Text('Unrecognized Card'),
                  content: Text(
                      'The QR or NFC you are trying to read is unrecognized. Please check and try again or contact support on'),
                  actions: [
                    TextButton(
                      child: Text('Ok'),
                      onPressed: () {
                        Get.to(CashinHomeScreen());
                      },
                    ),
                  ],
                );
              },
            );
          }
        }
      });
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      // controller!.pauseCamera();
      controller!.resumeCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  Future readQr() async {
    if (result != null) {
      controller!.pauseCamera();
      setState(() {
        print(result!.code);
        controller!.dispose();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // readQr();
    return Scaffold(
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.blue,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: 250,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
