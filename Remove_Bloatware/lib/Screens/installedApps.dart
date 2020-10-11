import 'package:device_apps/device_apps.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class InstalledApps extends StatelessWidget {
  final bool includeSystemApps;

  const InstalledApps({
    Key key,
    this.includeSystemApps: false,
  }) : super(key: key);
  bool isDangerous(String appName) {
    List<String> dangerousApps = [
      'Google',
      'Google Play Store',
      'Android Services Library',
      'Media Storage',
      'Android shared Library',
      'External Storage',
      'Companion Device Manager',
      'MmsService',
      'ConfigUpdater',
      'Package Access Helper',
      'PacProcessor',
      'androidhwext',
      'Certificate Installer',
      'com.android.carrierconfig',
      'Android System',
      'MTP host',
      'Intent Filter Verification Service',
      'Settings Storage',
      'com.android.frameworkres.overlay',
      'Input Devices',
      'Android System WebView',
      'Key Chain',
      'Package installer',
      'Google Services Framework',
      'ProxyHandler',
      'Work profile setup',
      'Google Backup Transport',
      'Settings',
      'com.android.cts.ctsshim',
      'VpnDialogs',
      'Shell',
      'Fused Location',
      'system UI',
      'Exchange Services',
      'Bluetooth',
      'com.android.cts.priv.ctsshim'
    ];
    if (dangerousApps.contains(appName)) {
      return true;
    } else {
      return false;
    }
  }

  /// @todo Refactor Code
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
                          title: isDangerous(app.appName)
                              ? Text(
                                  '${app.appName} (${app.packageName})',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                )
                              : Text(
                                  '${app.appName} (${app.packageName})',
                                  style: TextStyle(
                                    color: Colors.green,
                                  ),
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
        });
  }
}
