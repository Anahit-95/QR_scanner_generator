import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_generator_scanner/qr_scanner.dart.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import './generate_qr_code.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController textQr = TextEditingController();
  String textQrCodeScan = '';

  Future<void> scanQrCode() async {
    // try {
    //   final qrCod = await FlutterBarcodeScanner.scanBarcode(
    //     "#ff6666",
    //     "cancel",
    //     true,
    //     ScanMode.QR,
    //   );
    //   if (!mounted) return;
    //   // if (qrCod.isNotEmpty) {
    //   print("My code qr : $qrCod");
    //   setState(() {
    //     textQrCodeScan = qrCod;
    //   });
    //   // }
    // } on PlatformException {
    //   print("exception");
    //   textQrCodeScan = 'Failed to scan QR Code.';
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Generate QR code and share',
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              controller: textQr,
              cursorColor: Theme.of(context).primaryColor,
              decoration: const InputDecoration(
                hintText: "Enter text",
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (BuildContext context) => CreateQRCode(
                      textQrCode: textQr.text.trim(),
                    ),
                  ),
                );
              },
              child: Container(
                height: 50,
                color: Theme.of(context).primaryColor,
                child: const Center(
                  child: Text(
                    'Generate',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              // onTap: () => scanQrCode(),
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (BuildContext context) => QRScanner(),
                  ),
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.document_scanner_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Scanner',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (textQrCodeScan.isNotEmpty)
              Center(
                child: Text(
                  textQrCodeScan,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

// # flutter_barcode_scanner: ^2.0.0
//   # path_provider: ^2.0.13
//   # qr_flutter: ^4.0.0
//   # share: ^2.0.4
