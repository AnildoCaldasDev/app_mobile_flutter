import 'package:app_mobile_flutter/pages/chartpage.dart';
import 'package:app_mobile_flutter/pages/homepageclean.dart';
import 'package:app_mobile_flutter/pages/listusers.dart';
import 'package:app_mobile_flutter/scanner.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget{
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  var _currentIndex = 0;
  getBodyWidget(){

    switch (_currentIndex) {
      case 0:
        return HomePageClean();
        break;

      case 1:
        return ScannerPage();
        break;

        case 2:
        return ChartPage();
        break;

      case 3:
        return ListUsersPage();
        break;
      
      default:
    }


    return (_currentIndex == 0) ? HomePageClean() : Container();
  }


  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(title: Text("Foxgam"), centerTitle: true,),
        backgroundColor: Color(0xFFF0F0F0),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index){
              setState(() {
                _currentIndex = index;
              });
          },
          items: [            
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), title: Text("New")),
            BottomNavigationBarItem(icon: Icon(Icons.pie_chart), title: Text("Statistics")),
            BottomNavigationBarItem(icon: Icon(Icons.more), title: Text("More")),                  
          ]
          ),
          body: getBodyWidget(),
    );
  }
}