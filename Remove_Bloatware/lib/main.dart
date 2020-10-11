import 'package:flutter/material.dart';
import 'Screens/installedApps.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red[400],
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showSystemApps = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Installed Apps'),
        actions: <Widget>[
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<String>>[
                PopupMenuItem<String>(
                  value: 'system_apps',
                  child: _showSystemApps == true
                      ? const Text("Exclude system apps")
                      : const Text('Include system apps'),
                ),
              ];
            },
            onSelected: (String key) {
              if (key == 'system_apps') {
                setState(
                  () {
                    _showSystemApps = !_showSystemApps;
                  },
                );
              }
            },
          )
        ],
      ),
      body: InstalledApps(
        includeSystemApps: _showSystemApps,
        key: GlobalKey(),
      ),
    );
  }
}
