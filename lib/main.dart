import 'package:flutter/material.dart';

import 'login.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Application',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ScannerPage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         primarySwatch: Colors.blue,
      ),
      home: LoginPage(title: 'Login'),
    );
  }
}
