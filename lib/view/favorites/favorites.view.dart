import 'package:flutter/material.dart';
import 'package:libraria_user_app/design_system/appBarTop/appBarTop.ds.dart';
import 'package:libraria_user_app/design_system/typography.ds.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({ Key? key }) : super(key: key);

  @override
  _FavoritesViewState createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: libHomeAppBarLight('Favorites', [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.account_circle_outlined),
        )
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Headline5(title: 'Favorite Books',)
          ],
        ),
      ),
    );
  }
}