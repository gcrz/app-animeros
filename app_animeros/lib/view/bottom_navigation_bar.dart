import 'package:app_animeros/view/screens/homepage.dart';
import 'package:app_animeros/view/screens/anime_list.dart';
import 'package:app_animeros/view/screens/statistics.dart';
import 'package:app_animeros/view/screens/user_profile_screens/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavigationBarState();
  }
}

class BottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentPage = 0;
  List<Widget> _pages = [
    MyHomePage(),
    UserStatistics(),
    Column(),
    UserAnimeList(),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("ANIMEROS"),
        ),
        body: _pages[_currentPage],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Pagina inicial"),
            BottomNavigationBarItem(
                icon: Icon(Icons.leaderboard), label: "Estatísticas"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Procura"),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_sharp), label: "Lista de animes"),
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
  }
}
