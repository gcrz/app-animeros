import 'dart:developer';

import 'package:app_animeros/custom_theme.dart';
import 'package:app_animeros/model/theme_provider.dart';
import 'package:app_animeros/view/screens/homepage.dart';
import 'package:app_animeros/view/screens/anime_list/anime_list.dart';
import 'package:app_animeros/view/screens/search_page.dart';
import 'package:app_animeros/view/screens/statistics.dart';
import 'package:app_animeros/view/screens/user_profile_screens/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavigationBarState();
  }
}

class BottomNavigationBarState extends State<MyBottomNavigationBar> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();
  int _currentPage = 0;
  List<Widget> _pages = [
    MyHomePage(),
    UserStatistics(),
    SearchPage(),
    UserAnimeList(),
    UserProfile(),
  ];

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget child) {
          return MaterialApp(
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text("ANIMEROS"),
              ),
              body: _pages[_currentPage],
              bottomNavigationBar: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Início"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.leaderboard), label: "Estatísticas"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: "Procura"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.list_sharp), label: "Lista"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle), label: "Perfil"),
                ],
                currentIndex: _currentPage,
                onTap: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                backgroundColor: Colors.blue,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}
