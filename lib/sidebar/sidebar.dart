import 'dart:async';

import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'menu_item.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 400);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
        initialData: false,
        stream: isSidebarOpenedStream,
        builder: (context, isSideBarOpenedAsync) {
          return AnimatedPositioned(
            duration: _animationDuration,
            top: 0,
            bottom: 0,
            left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
            right: isSideBarOpenedAsync.data ? 0 : screenWidth - 40,
            child: Row(children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: Color(0xFF262AAA),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 70),
                      ListTile(
                        title: Text("Quele Darlen",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w800)),
                        subtitle: Text("queledarlen_15@hotmail.com",
                            style: TextStyle(
                                color: Color(0xFF1BB5FD), fontSize: 13)),
                        leading: CircleAvatar(
                          child: 
                         // ImageIcon(AssetImage("assets/ImageProfile.png")),
                           Image.network("https://scontent.fudi1-2.fna.fbcdn.net/v/t1.0-1/c0.0.160.160a/p160x160/73233577_1251549888358774_8797157005866303488_o.jpg?_nc_cat=101&_nc_sid=dbb9e7&_nc_ohc=-4N1AWeB37sAX_1LzX-&_nc_ht=scontent.fudi1-2.fna&oh=635ed35694bb0e2249a21c1c7ddd2dbf&oe=5E95BD0D"),
                          // radius: 40,
                          // Icon(
                          //   Icons.perm_identity,
                          //   color: Colors.white,
                          // ),
                          radius: 40,
                        ),
                      ),
                      Divider(
                        color: Colors.white.withOpacity(0.3),
                        height: 44,
                        thickness: 0.5,
                        indent: 22,
                        endIndent: 32,
                      ),
                      MenuItem(icon: Icons.home, title: "Início", onTap: (){ 
                        onIconPressed();
                        BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                      }),
                      // MenuItem(icon: Icons.person, title: "Minha Conta", onTap: (){ 
                      //   onIconPressed();
                      //   BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyAccountClickedEvent);
                      // }),
                      // MenuItem(icon: Icons.shopping_basket, title: "Meus Pedidos", onTap: (){ 
                      //   onIconPressed();
                      //   BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyOrdersClickedEvent);
                      // }),
                      MenuItem(icon: Icons.pie_chart_outlined, title: "Gráficos", onTap: (){
                        onIconPressed();
                        BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.ChartPageClickedEvent);
                      }),
                      MenuItem(icon: Icons.pie_chart_outlined, title: "Dashboards", onTap: (){
                        onIconPressed();
                        BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.DashboardPageClickedEvent);
                      }),
                      MenuItem(icon: Icons.pie_chart_outlined, title: "Gráficos", onTap: (){
                        onIconPressed();
                        BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.ChartPageClickedEvent);
                      }),
                      MenuItem(icon: Icons.pie_chart_outlined, title: "Scan QRCode", onTap: (){
                        onIconPressed();
                        BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.ScannerPageClickedEvents);
                      }),
                      Divider(
                        color: Colors.white.withOpacity(0.3),
                        height: 24,
                        thickness: 0.5,
                        indent: 32,
                        endIndent: 32,
                      ),
                       MenuItem(icon: Icons.settings, title: "Configurações"),
                       MenuItem(icon: Icons.exit_to_app, title: "Sair"),
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment(0, -0.9),
                  child: GestureDetector(
                    onTap: () {
                      onIconPressed();
                    },
                    child: ClipPath(
                      clipper: CustomMenuClipper(),
                      child: 
                      Container(
                      width: 35,
                      height: 110,
                      alignment: Alignment.centerLeft,
                      color: Color(0xFF262AAA),
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Color(0xFF1BB5FD),
                        size: 25,
                      ),
                    )
                    ,)
                  ))
            ]),
          );
        });
  }
}

class CustomMenuClipper extends CustomClipper<Path>{
  @override
  getClip(Size size) {

    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height/2-20, width, height/2);
    path.quadraticBezierTo(width + 1, height/2+20, 10, height-16);
     path.quadraticBezierTo(0, height - 8, 0, height);


    path.close();


    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
   return true;
  }

}
