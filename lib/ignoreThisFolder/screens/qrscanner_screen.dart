import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(62, 58, 57, 1),
      appBar: AppBar(
        title: Text(
          'QR Scanner Demo',
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
}
