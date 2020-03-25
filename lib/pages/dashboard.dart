import 'package:app_mobile_flutter/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Dashboard extends StatefulWidget with NavigationStates {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  
  Material MyItems(IconData icon, String heading, int color) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //text
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      heading,
                      style: TextStyle(color: new Color(color), fontSize: 20.0),
                    ),
                  ),

                  //icon
                  Material(
                    color: new Color(color),
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
        child: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: <Widget>[
          MyItems(Icons.graphic_eq, "Total Views", 0xffed622b),
          MyItems(Icons.bookmark, "Bookmark", 0xff26cb3c),
          MyItems(Icons.notifications, "Notificações", 0xffff3266),
          MyItems(Icons.attach_money, "Contabilidade", 0xff3399fe),
          MyItems(Icons.settings, "Configurar", 0xfff4c83f),
          MyItems(Icons.group_work, "Grupos", 0xff622F74),
          MyItems(Icons.favorite, "Seguidores", 0xffad61f1),
          MyItems(Icons.message, "Mensagens", 0xff7297ff),
           MyItems(Icons.people, "Pessoas", 0xff7297ff),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 130.0),
          StaggeredTile.extent(1, 250.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(2, 240.0),
          StaggeredTile.extent(2, 120.0),
          StaggeredTile.extent(2, 130.0),
        ],
      ),
    ));
  }
}
