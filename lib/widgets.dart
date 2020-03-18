import 'dart:ui';

import 'package:flutter/material.dart';

class MyWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Exemplos de Widgets")),
        body: Container(
          child: Column(
            children: <Widget>[
              Center(
                  child: Text(
                "Hello Kabeça!!!!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              )),
              Center(
                child: new Image(
                  image: new AssetImage("assets/loading.gif"),
                  width: 100,
                  height: 100,
                ),
              ),
             // Divider(),
              Expanded(
                child: Center(
                    child: TextField(
                        decoration: InputDecoration(
                            hintText: "Exemplo de Email Textbox",
                            icon: Icon(Icons.email)),                        
                        maxLines: 4)),
              )
            ],
          ),
        ));
  }
}
