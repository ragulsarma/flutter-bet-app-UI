import 'package:bet_app/common/size_config.dart';
import 'package:bet_app/screens/menu_screens/home_screen.dart';
import 'package:bet_app/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'menu_screens/calendar_screen.dart';
import 'menu_screens/fav_screen.dart';
import 'menu_screens/winners_screen.dart';

/// Created by Ragul nathan.
/// ragulsarma@gmail.com

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List<Widget> _children = List<Widget>();

  GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  void initState() {
    _children.add(HomeScreen());
    _children.add(CalendarScreen());
    _children.add(FavScreen());
    _children.add(WinnersListScreen());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: IndexedStack(
        index: _currentIndex,
        children: _children,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: _onTabTapped,
      backgroundColor: Colors.white,
      elevation: 0,
      unselectedItemColor: Colors.black38,
      selectedItemColor: AppColors.primary,
      items: [
        BottomNavigationBarItem(
            icon: Container(
              child: Icon(
                Icons.assessment_outlined,
                color: _currentIndex == 0 ? Colors.white : Colors.black38,
              ),
              padding: EdgeInsets.all(SizeConfig.width_2),
              decoration: new BoxDecoration(
                color:
                    _currentIndex == 0 ? AppColors.primary : Colors.transparent,
                shape: BoxShape.circle,
              ),
            ),
            title: Text('')),
        BottomNavigationBarItem(
            icon: Container(
              child: Icon(
                Icons.calendar_today_outlined,
                color: _currentIndex == 1 ? Colors.white : Colors.black38,
              ),
              padding: EdgeInsets.all(SizeConfig.width_2),
              decoration: new BoxDecoration(
                color:
                    _currentIndex == 1 ? AppColors.primary : Colors.transparent,
                shape: BoxShape.circle,
              ),
            ),
            title: Text('')),
        BottomNavigationBarItem(icon: Icon(Icons.star_border), title: Text('')),
        BottomNavigationBarItem(
            icon: Icon(Icons.military_tech), title: Text('')),
      ],
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
    );
  }

  _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
