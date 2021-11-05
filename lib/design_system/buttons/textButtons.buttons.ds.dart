import 'package:flutter/material.dart';
import 'package:libraria_user_app/design_system/color.ds.dart';
import 'package:libraria_user_app/design_system/typography.ds.dart';

const double buttonHeight = 50;
const double buttonWidth = double.infinity;

class LibPrimaryButton extends StatelessWidget {
  LibPrimaryButton({
    Key? key,
    required this.textTitle,
    required this.routeLink,
  }) : super(key: key);

  final String textTitle;
  final Widget routeLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => routeLink));
          },
          child: ButtonText1(title: textTitle)),
    );
  }
}

class LibPrimaryFormButton extends StatelessWidget {
  LibPrimaryFormButton({
    Key? key,
    required this.textTitle,
    required this.onPressed
  }) : super(key: key);
  final String textTitle;
  final void onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
          onPressed: (){},
          child: ButtonText1(title: textTitle)),
    );
  }
}

class LibLightButton extends StatelessWidget {
  LibLightButton({
    Key? key,
    required this.textTitle,
    required this.routeLink,
  }) : super(key: key);

  final String textTitle;
  final Widget routeLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      height: buttonHeight,
      color: grey200,
      child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => routeLink));
          },
          child: ButtonText1(title: textTitle)),
    );
  }
}

class LibFormSubmitButton extends StatelessWidget {
  const LibFormSubmitButton({
    Key? key,
    required this.textTitle,
    required this.routeLink,
  }) : super(key: key);

  final String textTitle;
  final Widget routeLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      height: buttonHeight,
      color: grey200,
      child: TextButton(
          onPressed: () {
            // function for validation
            Navigator.push(context, MaterialPageRoute(builder: (context) => routeLink));
          },
          child: ButtonText1(title: textTitle)),
    );
  }
}
