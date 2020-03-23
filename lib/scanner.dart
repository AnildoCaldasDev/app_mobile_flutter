import 'package:app_mobile_flutter/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:app_mobile_flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

class ScannerPage extends StatefulWidget with NavigationStates{
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
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: RaisedButton(
                    color: Theme.of(context).primaryColorDark,
                    textColor: Theme.of(context).primaryColorLight,
                    onPressed: () => scannQrCode(),
                    child: Text(
                      'Scann QRCode',
                      textScaleFactor: 1.5,
                    ))),
            Divider(),
            Center(
              child: Text(
                code,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            Center(
                child: RaisedButton(
                    color: Theme.of(context).primaryColorDark,
                    textColor: Theme.of(context).primaryColorLight,
                    onPressed: () => goToWidgetsPage(),
                    child: Text(
                      'Go to Widgets Page',
                      textScaleFactor: 1.5,
                    )))
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

  goToWidgetsPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyWidgets()));
  }
}
