import 'package:app_mobile_flutter/bloc.navigation_bloc/navigation_bloc.dart';
//import 'package:app_mobile_flutter/pages/home.dart';
import 'package:app_mobile_flutter/sidebar/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<NavigationBloc>(
      create: (context) => NavigationBloc(),
      child: Stack(
        children: <Widget>[
          BlocBuilder<NavigationBloc, NavigationStates>(
            builder: (context, navigationState) {
              return navigationState as Widget;
            },
          ),
          SideBar(),
        ],
      ),
    ));
  }
}
