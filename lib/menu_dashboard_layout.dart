import 'package:flutter/material.dart';

final Color backGroundColor = Color(0xFF4A4A58);
final TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 22);

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 500);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.6).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
        backgroundColor: backGroundColor,
        body: Stack(
          children: <Widget>[menu(context), dashboard(context)],
        ));
  }

  Widget menu(context) {
    return SlideTransition(
        position: _slideAnimation,
        child: ScaleTransition(
          scale: _menuScaleAnimation,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Dashboard", style: textStyle),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Messages", style: textStyle),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Utility Bills", style: textStyle),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Funds Transfer", style: textStyle),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Branchs", style: textStyle)
                  ]),
            ),
          ),
        ));
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
        duration: duration,
        top: 0,
        bottom: 0,
        left: isCollapsed ? 0 : 0.6 * screenWidth,
        right: isCollapsed ? 0 : -0.4 * screenWidth,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Material(
              animationDuration: duration,
              borderRadius: BorderRadius.all(Radius.circular(40)),
              elevation: 8,
              color: backGroundColor,
              child: Container(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
                  child: Column(children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          InkWell(
                              child: Icon(Icons.menu, color: Colors.white),
                              onTap: () {
                                setState(() {
                                  if (isCollapsed)
                                    _controller.forward();
                                  else
                                    _controller.reverse();

                                  isCollapsed = !isCollapsed;
                                });
                              }),
                          Text(
                            "My Cards",
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          Icon(Icons.settings, color: Colors.white)
                        ]),
                    SizedBox(height: 50),
                    FractionallySizedBox(
                        heightFactor: 0.25,
                        alignment: Alignment.center,
                        child: PageView(
                          controller: PageController(viewportFraction: 0.8),
                          scrollDirection: Axis.horizontal,
                          pageSnapping: true,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              color: Colors.redAccent,
                              width: 100,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              color: Colors.blueAccent,
                              width: 100,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              color: Colors.greenAccent,
                              width: 100,
                            ),
                          ],
                        ))
                  ]))),
        ));
  }
}
