import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageClean extends StatelessWidget {
  var services = [
    "Downtime",
    "Access Control",
    "Spare Parts",
    "Master Data",
    "iChat",
    "IPQC",
    "Optsti",
    "MMS",
    "Foxzilla"
  ];

  // var iconDataList = [
  //   Icons.timer,
  //   Icons.accessibility,
  //   Icons.settings_input_component,
  //   Icons.desktop_windows,
  //   Icons.chat,
  //   Icons.dashboard,
  //   Icons.question_answer,
  //   Icons.flip_to_back,
  //   Icons.data_usage
  // ];

  var images = [
    "assets/account.png",
    "assets/industry.png",
    "assets/listicon.png",
    "assets/timer.png",
    "assets/account.png",
    "assets/listicon.png",
    "assets/timer.png",
    "assets/industry.png",
    "assets/account.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: GridView.builder(
          itemCount: services.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 2.5)),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 9.0,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Image.asset(images[index], height: 40, width: 40),
                  // Center( child: Icon(iconDataList[index],
                  //         size: 50, color: Colors.blue)),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      services[index],
                      style: TextStyle(
                          fontSize: 16,
                          height: 1.2,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
