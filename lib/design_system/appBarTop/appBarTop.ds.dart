import 'package:flutter/material.dart';
import 'package:libraria_user_app/design_system/color.ds.dart';

PreferredSizeWidget libTopAppBarLight( Widget? textTitle, List<Widget> actions,) {
  return AppBar(
    title: textTitle,
    elevation: 0,
    backgroundColor: transparentColor,
    iconTheme: IconThemeData(color: lightPrimaryColor),
    actions: actions,
  );
}

PreferredSizeWidget libHomeAppBarLight( String textTitle, List<Widget> actions,) {
  return AppBar(
    leading: Icon(Icons.menu),
    centerTitle: true,
    title: Text(textTitle, style: TextStyle(color: grey900),),
    elevation: 0,
    backgroundColor: transparentColor,
    iconTheme: IconThemeData(color: lightPrimaryColor),
    actions: actions,
  );
}