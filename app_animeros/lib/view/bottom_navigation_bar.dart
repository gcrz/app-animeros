import 'package:app_animeros/logic/manage_db/manage_remote_db_bloc.dart';
import 'package:app_animeros/logic/monitor_db/monitor_db_bloc.dart';
import 'package:app_animeros/view/screens/homepage.dart';
import 'package:app_animeros/view/screens/anime_list/anime_list.dart';
import 'package:app_animeros/view/screens/search_page.dart';
import 'package:app_animeros/view/screens/statistics.dart';
import 'package:app_animeros/view/screens/user_profile_screens/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    SearchPage(),
    UserAnimeList(),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MonitorBloc()),
        BlocProvider(create: (_) => ManageRemoteBloc())
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("ANIMEROS"),
          ),
          body: _pages[_currentPage],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
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
      ),
    );
  }
}
