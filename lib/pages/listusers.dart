import 'package:app_mobile_flutter/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//referencia da aulade http requests: https://www.youtube.com/watch?v=skQ_m8Tcdlk
//referencia aula de listagem de user no flutter: https://www.youtube.com/watch?v=POexDexSpKE

class ListUsersPage extends StatefulWidget with NavigationStates {
  @override
  _ListUsersPageState createState() => _ListUsersPageState();
}

class _ListUsersPageState extends State<ListUsersPage> {
  String url = 'https://randomuser.me/api/?results=15';
  List data;

  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var extractedData = json.decode(response.body);
      data = extractedData["results"];
    });
  }

  @override
  void initState() {
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: Text("Fazendo Requests no Flutter"), centerTitle: true),
        body: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, i) {
              return new ListTile(
                title: new Text(data[i]["name"]["first"]),
                subtitle: new Text(data[i]["phone"]),
                leading: new CircleAvatar(
                  backgroundImage:
                      new NetworkImage(data[i]["picture"]["thumbnail"]),
                ),
                onTap: () {
                  Navigator.push(context, new MaterialPageRoute(builder: 
                  (BuildContext context) => 
                    new SecondPage(data[i])));
                },
              );
            }));
  }
}

class SecondPage extends StatelessWidget {
  SecondPage(this.data);
  final data;
  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: new AppBar(
          title: new Text("User Detail Page"),
        ),
        body: new Center(
          child: new Container(
            width: 150.0,
            height: 150.0,
            decoration: new BoxDecoration(
                color: const Color(0xff7c94b6),
                image: new DecorationImage(
                    image: new NetworkImage(data["picture"]["large"]),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: new BorderRadius.all(new Radius.circular(75.0)),
                  border: new Border.all(
                    color: Colors.red,
                    width: 4.0,
                  ),
                ),
          ),
        ),
      );
}
