import 'package:app_mobile_flutter/scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.0,
                //color: Colors.blue,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF6493f9),
                          Color(0xFF5bc4f7),
                        ]),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(100))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.person,
                        size: 90,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 32),
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                padding: EdgeInsets.only(top: 62),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 5)
                          ]),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.email), hintText: "E-mail"),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      margin: EdgeInsets.only(top: 32),
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 5)
                          ]),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.vpn_key), hintText: "Senha"),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 16, right: 32),
                        child: Text(
                          "Esqueceu a Senha?",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      //margin: EdgeInsets.only(top: 62),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.green,
                            Colors.green,
                          ]),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Center(
                          child: RaisedButton(                          
                          elevation: 0.0,
                        color: Colors.green,
                        textColor: Theme.of(context).primaryColorLight,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ScannerPage()));
                        },
                        child: Text(
                          'Entrar',
                          textScaleFactor: 1.5,
                        ),
                      )),
                    )

                    //botão original correto comentado
                    // Container(
                    //   width: MediaQuery.of(context).size.width / 1.2,
                    //   height: 50,
                    //   //margin: EdgeInsets.only(top: 62),
                    //   decoration: BoxDecoration(
                    //       gradient: LinearGradient(colors: [
                    //         Color(0xFF6493f9),
                    //         Color(0xFF5bc4f7),
                    //       ]),
                    //       borderRadius: BorderRadius.all(Radius.circular(50))),
                    //   child:
                    //   Center(
                    //       child:
                    //       Text("Entrar",
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontSize: 18,
                    //               fontWeight: FontWeight.bold)
                    //       )

                    //       ),
                    // )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
