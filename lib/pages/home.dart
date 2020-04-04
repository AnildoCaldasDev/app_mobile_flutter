import 'dart:io';

import 'package:app_mobile_flutter/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget with NavigationStates {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image;

  Future getImageFromCam() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;      
    });
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Picker Example"), centerTitle: true,),
      body: ListView(children: <Widget>[
        SizedBox(height: 10,),
        Container(
          width: MediaQuery.of(context).size.width + 200,
          height: 200.0,
          child: Center(
            child: _image == null ? Text("No Image selected") : Image.file(_image),
          )
        ),
         SizedBox(height: 10,),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
          FloatingActionButton(
            onPressed: getImageFromCam,
            tooltip: "Tirar foto",
            child: Icon(Icons.add_a_photo),
          ),
          FloatingActionButton(
            onPressed: getImageFromGallery,
            tooltip: "Selecionar foto",
            child: Icon(Icons.wallpaper),
          )
        ],)
      ],),
    );
  }
}
