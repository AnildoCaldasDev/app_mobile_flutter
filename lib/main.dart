//import 'package:app_mobile_flutter/sidebar/sidebar_layout.dart';
import 'package:flutter/material.dart';
import 'package:app_mobile_flutter/mainpage.dart';

//import 'login.dart';
//import 'menu_dashboard_layout.dart';

//import 'login.dart';

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


//Versão usada para rodar chamando a tela de login e depois o qrcode:
// void main() => runApp(MyApp());
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//          primarySwatch: Colors.blue,
//       ),
//       home: LoginPage(title: 'Login'),
//     );
//   }
// }

//versão usando o navigation bar com slide
// void main() => runApp(MyApp());
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//          primarySwatch: Colors.blue,
//       ),
//       home: MenuDashboardPage(),
//      //home: LoginPage(),
//     );
//   }
// }


//Este bloco é usado para a navegação na tela com menu azul arrendondado na lateral:
// void main() => runApp(MyApp());
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         scaffoldBackgroundColor: Colors.white,
//         primaryColor: Colors.white
//       ),
//       home: SideBarLayout(),
//      //home: LoginPage(),
//     );
//   }
// }


//Este bloco é para uso do novo model de navegaçãocom tabbar e dashboard clean:
//fonte: https://www.youtube.com/watch?v=leA2nZYM9jY
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
       // primaryColor: Colors.white,
        primarySwatch: Colors.indigo
      ),      
      home: MainPage(),
     //home: LoginPage(),
    );
  }
}