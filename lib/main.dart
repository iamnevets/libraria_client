import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:libraria_user_app/controller/notifier/bookNotifier.dart';
import 'package:libraria_user_app/view/auth/auth.signup.view.dart';
import 'package:libraria_user_app/view/navigation/rootNav.view.dart';
import 'package:provider/provider.dart';
import 'design_system/color.ds.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    child: MyApp(),
    providers: [
    ChangeNotifierProvider(
      // builder: (BuildContext context)=> BookNotifier(),
      create: (context)=> BookNotifier())
  ]));
}

DatabaseReference userReference = FirebaseDatabase.instance.reference().child("users");

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  var currentTheme = ThemeData.light();
  // This is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, title: 'Libraria', theme: librariaTheming(), home: FirebaseAuth.instance.currentUser == null ? AuthSignUpView() : NavigationView());
  }
}


