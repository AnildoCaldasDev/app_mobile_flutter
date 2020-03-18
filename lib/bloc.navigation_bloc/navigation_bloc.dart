import 'package:app_mobile_flutter/pages/accountpage.dart';
import 'package:app_mobile_flutter/pages/home.dart';
import 'package:app_mobile_flutter/pages/orderspage.dart';
import 'package:bloc/bloc.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  MyOrdersClickedEvent
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
    }
  }
}
