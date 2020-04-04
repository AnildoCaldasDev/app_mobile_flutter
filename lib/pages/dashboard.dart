// import 'package:app_mobile_flutter/bloc.navigation_bloc/navigation_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// class Dashboard extends StatefulWidget with NavigationStates {
//   @override
//   _DashboardState createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {

//   Material MyItems(IconData icon, String heading, int color) {
//     return Material(
//       color: Colors.white,
//       elevation: 14.0,
//       shadowColor: Color(0x802196F3),
//       borderRadius: BorderRadius.circular(24.0),
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   //text
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       heading,
//                       style: TextStyle(color: new Color(color), fontSize: 20.0),
//                     ),
//                   ),

//                   //icon
//                   Material(
//                     color: new Color(color),
//                     borderRadius: BorderRadius.circular(24.0),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Icon(
//                         icon,
//                         color: Colors.white,
//                         size: 30.0,
//                       ),
//                     ),
//                   ),

//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "Dashboards",
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       body: Container(
//         color: Color(0xffE5E5E5),
//         child: StaggeredGridView.count(
//         crossAxisCount: 2,
//         crossAxisSpacing: 12.0,
//         mainAxisSpacing: 12.0,
//         padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//         children: <Widget>[
//           MyItems(Icons.graphic_eq, "Total Views", 0xffed622b),
//           MyItems(Icons.bookmark, "Bookmark", 0xff26cb3c),
//           MyItems(Icons.notifications, "Notificações", 0xffff3266),
//           MyItems(Icons.attach_money, "Contabilidade", 0xff3399fe),
//           MyItems(Icons.settings, "Configurar", 0xfff4c83f),
//           MyItems(Icons.group_work, "Grupos", 0xff622F74),
//           MyItems(Icons.favorite, "Seguidores", 0xffad61f1),
//           MyItems(Icons.message, "Mensagens", 0xff7297ff),
//            MyItems(Icons.people, "Pessoas", 0xff7297ff),
//         ],
//         staggeredTiles: [
//           StaggeredTile.extent(2, 130.0),
//           StaggeredTile.extent(1, 250.0),
//           StaggeredTile.extent(1, 130.0),
//           StaggeredTile.extent(1, 130.0),
//           StaggeredTile.extent(1, 150.0),
//           StaggeredTile.extent(1, 130.0),
//           StaggeredTile.extent(2, 240.0),
//           StaggeredTile.extent(2, 120.0),
//           StaggeredTile.extent(2, 130.0),
//         ],
//       ),
//     ));
//   }
// }

//fonte do exemplode dashboard: https://medium.com/@afegbua/flutter-thursday-app-dashboard-565df2aab12c
import 'package:app_mobile_flutter/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Dashboard extends StatefulWidget with NavigationStates {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {

    
// user defined function
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  
Card makeDashboardItem(String title, IconData icon) {
  return Card(
    elevation: 10.0,
    margin: new EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
      child: new InkWell(
        onTap: () {
          _showDialog();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            SizedBox(height: 50.0),
            Center(child: Icon(icon, size: 40.0, color: Colors.blue)),
            SizedBox(height: 20.0),
            new Center(
                child: new Text(title,
                    style: new TextStyle(fontSize: 18.0, color: Colors.black)))
          ],
        ),
      ),
    ),
  );
}
  
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Dashboards",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          color: Color(0xffE5E5E5),
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(3.0),
            children: <Widget>[
              makeDashboardItem("Downtimes", Icons.timer),
              makeDashboardItem("Access Control", Icons.accessibility),
              makeDashboardItem("Spare Parts", Icons.settings_input_component),
              makeDashboardItem("Master Data", Icons.desktop_windows),
              makeDashboardItem("FoxGram", Icons.chat),
              makeDashboardItem("FoxZilla", Icons.dashboard),
              makeDashboardItem("IPQC", Icons.question_answer),
              makeDashboardItem("ShoppFloor", Icons.flip_to_back)
            ],
          ),
        ));
  }
}

