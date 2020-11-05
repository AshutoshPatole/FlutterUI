import 'package:device_apps/device_apps.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class InstalledApps extends StatelessWidget {
  final bool includeSystemApps;

  const InstalledApps({
    Key key,
    this.includeSystemApps: false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Application>>(
      future: DeviceApps.getInstalledApplications(
        includeAppIcons: true,
        includeSystemApps: includeSystemApps,
      ),
      builder:
          (BuildContext context, AsyncSnapshot<List<Application>> snapshot) {
        if (snapshot.data == null) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.1,
              child: const FlareActor(
                "assets/loading.flr",
                animation: "active",
              ),
            ),
          );
        } else {
          List<Application> apps = snapshot.data;
          return Scrollbar(
            radius: const Radius.circular(20),
            thickness: 5.0,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  Application app = apps[index];

                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: app is ApplicationWithIcon
                            ? CircleAvatar(
                                backgroundImage: MemoryImage(app.icon),
                                backgroundColor: Colors.white,
                              )
                            : null,
                        onTap: () => DeviceApps.openApp(app.packageName),
                        title: Text(
                          '${app.appName} (${app.packageName})',
                        ),
                        subtitle: Text('Version  : ${app.versionName}\n'
                            'System app  : ${app.systemApp}\n'
                            'APK file path: ${app.apkFilePath}\n'
                            'Data dir  : ${app.dataDir}\n'
                            'Installed  : ${DateTime.fromMillisecondsSinceEpoch(app.installTimeMillis).toString()}\n'
                            'Updated  : ${DateTime.fromMillisecondsSinceEpoch(app.updateTimeMillis).toString()}'),
                      ),
                      const Divider()
                    ],
                  );
                },
                itemCount: apps.length),
          );
        }
      },
    );
  }
}
