import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:libraria_user_app/design_system/typography.ds.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primaryVariant),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Headline5(title: 'Profile'),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(Icons.person_outline),
              title: showUserName(context),
            )
          ],
        ),
      ),
    );
  }

  showUserName(context) {
    // User? currentUser = FirebaseAuth.instance.currentUser;
    String? currentUserName = FirebaseAuth.instance.currentUser!.email;

    if (currentUserName != null) {
      return Text(currentUserName + 'here');
    } else {
      return Text('user');
    }
  }
}
