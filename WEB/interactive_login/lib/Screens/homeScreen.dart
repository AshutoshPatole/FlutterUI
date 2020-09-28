import 'package:flutter/material.dart';
import 'package:portfolio/CustomWidegts/addPeople.dart';
import 'package:portfolio/CustomWidegts/calendar.dart';
import 'package:portfolio/CustomWidegts/searchBox.dart';
import 'package:portfolio/CustomWidegts/welcomeuser.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            minWidth: MediaQuery.of(context).size.width * 0.02,
            elevation: 8,
            // extended: false,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.desktop_windows_rounded),
                selectedIcon: Icon(Icons.desktop_windows),
                label: Text('Dashboard'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.calendar_today),
                selectedIcon: Icon(Icons.calendar_today_outlined),
                label: Text('Interviews'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.messenger),
                selectedIcon: Icon(Icons.message),
                label: Text('Messages'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bar_chart),
                selectedIcon: Icon(Icons.add_chart),
                label: Text('Reports'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                selectedIcon: Icon(Icons.admin_panel_settings),
                label: Text('Settings'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.power_settings_new_outlined),
                selectedIcon: Icon(Icons.power_settings_new),
                label: Text('Logout'),
              ),
            ],
          ),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: HomeContent(),
          )
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: width < 791
          ? EdgeInsets.symmetric(horizontal: 10, vertical: 20)
          : EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SearchBox(),
              AddPeople(),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          MediaQuery.of(context).size.width > 791
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WelcomeUser(),
                    Calendar(),
                  ],
                )
              : Column(
                  children: [
                    WelcomeUser(),
                    Calendar(),
                  ],
                )
        ],
      ),
    );
  }
}
