import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget  with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text("My Orders Page",
         style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
    );
  }
}
