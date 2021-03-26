import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRScan> {
  GlobalKey qrKey = GlobalKey();
  Barcode qrText;
  QRViewController controller;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("QR Scan")),

      body: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Main');
            },
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: QRView(
                      key: qrKey,
                      overlay: QrScannerOverlayShape(
                          borderRadius: 10,
                          borderColor: Colors.red,
                          borderLength: 30,
                          borderWidth: 10,
                          cutOutSize: 300),
                      onQRViewCreated: _onQRViewCreated),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text('Scan result: $qrText'),
                  ),)
              ],
            ),

          )
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }
}