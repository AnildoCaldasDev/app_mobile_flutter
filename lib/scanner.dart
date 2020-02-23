import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

class ScannerPage extends StatefulWidget {
  ScannerPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  String code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BarCode Scanner"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      onPressed: () => scannQrCode(),
                      child: Text(
                        'Scann QRCode',
                        textScaleFactor: 1.5,
                      ),
                    ),
            Text(
              code,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  scannQrCode() async {
    try {
      final result = await BarcodeScanner.scan();
      setState(() {
        code = result;
      });
    } catch (e) {
      print(e);
    }
  }
}
