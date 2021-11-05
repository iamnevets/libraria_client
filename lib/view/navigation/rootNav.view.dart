import 'package:flutter/material.dart';
import 'package:libraria_user_app/design_system/color.ds.dart';
import 'package:libraria_user_app/view/favorites/favorites.view.dart';
import 'package:libraria_user_app/view/home/home.view.dart';
import 'package:libraria_user_app/view/search/search.view.dart';
import 'package:libraria_user_app/view/settings/settings.view.dart';


class NavigationView extends StatefulWidget {
  const NavigationView({ Key? key }) : super(key: key);

  @override
  _NavigationViewState createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
    int selectedIndex = 0;
  final viewPages = [
    HomeView(),
    SearchView(),
    FavoritesView(),
    SettingsView()
  ];
    List<BottomNavigationBarItem> navBaritems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.layers_outlined),
      label: 'Home',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search',),
    BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favorites',),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings',),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: viewPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        items: navBaritems,
        selectedItemColor: lightSecondaryColor,
        unselectedItemColor: lightColorOnSurface,
      ),
    );
  }
}