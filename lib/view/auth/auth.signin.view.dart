import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:libraria_user_app/design_system/buttons/textButtons.buttons.ds.dart';
import 'package:libraria_user_app/design_system/color.ds.dart';
import 'package:libraria_user_app/design_system/typography.ds.dart';
import 'package:libraria_user_app/view/auth/auth.signup.view.dart';
import 'package:libraria_user_app/view/home/home.view.dart';
import 'package:libraria_user_app/view/navigation/rootNav.view.dart';

class AuthSignInView extends StatefulWidget {
  const AuthSignInView({Key? key}) : super(key: key);

  @override
  _AuthSignInViewState createState() => _AuthSignInViewState();
}

class _AuthSignInViewState extends State<AuthSignInView> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Headline5(
                title: 'Sign In',
                color: lightSecondaryAccentColor,
              ),
              TextBody1(
                title: 'Welcome back',
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      controller: usernameController,
                      decoration: InputDecoration(hintText: 'Username', prefixIcon: Icon(Icons.account_circle_outlined)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      obscureText: hidePassword,
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(
                            Icons.account_circle_outlined,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              icon: !hidePassword ? Icon(Icons.visibility_outlined) : Icon(Icons.visibility_off_outlined))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        LibLightButton(
                          textTitle: 'SIGN UP INSTEAD',
                          routeLink: AuthSignUpView(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: buttonWidth,
                          height: buttonHeight,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return NavigationView();
                                }));
                              },
                              child: ButtonText1(title: 'SIGN IN')),
                        )

                        // signInNewUser(context)),
                      ],
                    ),
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // void signInNewUser(BuildContext context) async {
  //   final FirebaseUser firebaseUser =
  //       (await _firebaseAuth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text)).user;

  //       if (firebaseUser !=null) {

  //       } else {
  //       }
  // }
}
