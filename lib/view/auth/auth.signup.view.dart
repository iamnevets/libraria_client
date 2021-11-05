import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:libraria_user_app/design_system/buttons/textButtons.buttons.ds.dart';
import 'package:libraria_user_app/design_system/color.ds.dart';
import 'package:libraria_user_app/design_system/typography.ds.dart';
import 'package:libraria_user_app/main.dart';
import 'package:libraria_user_app/view/auth/auth.signin.view.dart';
import 'package:libraria_user_app/view/navigation/rootNav.view.dart';

class AuthSignUpView extends StatefulWidget {
  const AuthSignUpView({Key? key}) : super(key: key);

  @override
  _AuthSignUpViewState createState() => _AuthSignUpViewState();
}

class _AuthSignUpViewState extends State<AuthSignUpView> {
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
                title: 'Sign Up',
                color: lightSecondaryAccentColor,
              ),
              TextBody1(
                title: 'Create a new Account',
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
                      controller: nameController,
                      decoration: InputDecoration(hintText: 'Full Name', prefixIcon: Icon(Icons.person_outline)),
                    ),
                  ),
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
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(hintText: 'Email Address', prefixIcon: Icon(Icons.mail_outline)),
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
                          textTitle: 'Log in Instead',
                          routeLink: AuthSignInView(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: buttonWidth,
                          height: buttonHeight,
                          child: ElevatedButton(
                              onPressed: () {
                                if (nameController.text.isEmpty ||
                                    emailController.text.isEmpty ||
                                    usernameController.text.isEmpty ||
                                    passwordController.text.isEmpty) {
                                  Fluttertoast.showToast(msg: 'One of the input fields are empty.');
                                }
                                if (nameController.text.length < 3) {
                                  Fluttertoast.showToast(msg: 'Name must be at least 3 characters');
                                } else if (!emailController.text.contains("@")) {
                                  Fluttertoast.showToast(msg: 'Does your email have the @symbol?');
                                }
                                signInNewUser(context);
                              },
                              child: ButtonText1(title: 'SIGN IN')),
                        ),
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

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void signInNewUser(BuildContext context) async {
    final User? firebaseUser =
        (await _firebaseAuth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text).catchError((errMsg) {
      Fluttertoast.showToast(msg: "Error" + errMsg.toString());
    })).user;

    if (firebaseUser != null) {
      Map userSignInData = {
        "name": nameController.text.trim(),
        "username": usernameController.text.trim(),
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
      };

      userReference.child(firebaseUser.uid).set(userSignInData);
      Fluttertoast.showToast(msg: "Your account has been created successfully.");
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return NavigationView();
      }));
    } else {
      Fluttertoast.showToast(msg: "User was not created due to an error. Please try again.");
    }
  }
}
