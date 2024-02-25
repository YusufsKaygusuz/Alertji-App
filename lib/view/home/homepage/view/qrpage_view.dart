import 'package:alertji_app/view/home/homepage/view/webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerPage extends StatefulWidget {
  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Allertji App'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      // Okunan QR kodunu alın
      String? scannedUrl = scanData.code;

      // Alınan URL'yi kontrol edin
      if (scannedUrl!.startsWith('http://') ||
          scannedUrl.startsWith('https://')) {
        // Eğer URL bir web sitesini işaret ediyorsa, web tarayıcısını açın

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => WebviewPreview(url: scannedUrl)),
            (Route<dynamic> route) => false);
      }
    });
  }
}
