import 'package:app_mobile_flutter/pages/accountpage.dart';
import 'package:app_mobile_flutter/pages/chartpage.dart';
import 'package:app_mobile_flutter/pages/dashboard.dart';
import 'package:app_mobile_flutter/pages/home.dart';
import 'package:app_mobile_flutter/pages/listusers.dart';
import 'package:app_mobile_flutter/pages/orderspage.dart';
import 'package:bloc/bloc.dart';

import '../scanner.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  MyOrdersClickedEvent,
  DashboardPageClickedEvent,
  ChartPageClickedEvent,
  ScannerPageClickedEvents,
  ListUsersPageClickedEvents
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.MyAccountClickedEvent:
        yield AccountPage();
        break;
      case NavigationEvents.MyOrdersClickedEvent:
        yield OrdersPage();
        break;
      case NavigationEvents.ChartPageClickedEvent:
        yield ChartPage();
        break;
      case NavigationEvents.DashboardPageClickedEvent:
        yield Dashboard();
        break;
       case NavigationEvents.ScannerPageClickedEvents:
        yield ScannerPage();
        break;
       case NavigationEvents.ListUsersPageClickedEvents:
        yield ListUsersPage();
        break;      
    }
  }
}
