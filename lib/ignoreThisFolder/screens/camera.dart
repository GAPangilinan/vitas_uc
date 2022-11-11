import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zxing/flutter_zxing.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class CameraQR extends StatefulWidget {
  const CameraQR({super.key});

  @override
  State<CameraQR> createState() => _CameraQRState();
}

class _CameraQRState extends State<CameraQR> {
  final GlobalKey _globalKey = GlobalKey();
  Barcode? result;
  CameraController? cameraController;

  @override
  void initState() async {
    super.initState();
    // await startCameraProcessing();
  }

  void qrview(CameraController cameraController) {
    setState(() {
      this.cameraController = cameraController;
      cameraController.startImageStream((image) async {
        CodeResult result = await processCameraImage(image);
        if (result.isValidBool) {
          debugPrint(result.textString);
        }
        return null;
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
      key: _globalKey,
      body: ReaderWidget(
        onScan: (result) async {
          qrview(cameraController!);
        },
      ),
    );
  }
}
