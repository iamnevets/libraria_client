import 'package:flutter/material.dart';
import 'package:libraria_user_app/design_system/appBarTop/appBarTop.ds.dart';
import 'package:libraria_user_app/design_system/color.ds.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool onNotifications = false;
  bool setTheming = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: libHomeAppBarLight('Settings', [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.account_circle_outlined),
        )
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            ListTile(
              title: Text('Notifications'),
              subtitle: Text('Notify me when new books arrive.'),
              trailing: Switch(
                  activeColor: lightPrimaryColor,
                  value: onNotifications,
                  onChanged: (bool notificationsTrue) {
                    setState(() {
                      onNotifications = notificationsTrue;
                    });
                  }),
            ),
            ListTile(
              title: Text('Theming'),
              subtitle: Text('Adjust the theme of the app.'),
              trailing: Switch(
                  activeColor: lightPrimaryColor,
                  value: setTheming,
                  onChanged: (bool setToDarkMode) {
                    setState(() {
                      setTheming = setToDarkMode;
                    });
                  }),
            ),
            ListTile(
              title: Text('Share'),
              subtitle: Text('Share Libraria with your friends!'),
              onTap: (){},
            ),
            ListTile(
              title: Text('About'),
              subtitle: Text('Learn more about us'),
              onTap: (){},
            ),
            ListTile(
              title: Text('Beta 1.0'),
              trailing: Text('Build Version'),
            )
          ],
        ),
      ),
    );
  }
}
