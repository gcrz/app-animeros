import 'package:flutter/material.dart';

class UserStatistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Suas estatísticas",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.green[300],
              elevation: 5,
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                const ListTile(
                  leading: Icon(
                    Icons.tv_sharp,
                    size: 30,
                    color: Colors.black,
                  ),
                  title: Text(
                    "200",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Animes assistidos"),
                )
              ])),
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.green[300],
              elevation: 5,
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                const ListTile(
                  leading: Icon(
                    Icons.play_arrow,
                    size: 30,
                    color: Colors.black,
                  ),
                  title: Text(
                    "100",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Episódios assistidos"),
                )
              ])),
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.green[300],
              elevation: 5,
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                const ListTile(
                  leading: Icon(
                    Icons.calendar_today,
                    size: 30,
                    color: Colors.black,
                  ),
                  title: Text(
                    "20",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Dias assistidos"),
                )
              ])),
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              color: Colors.green[300],
              elevation: 5,
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                const ListTile(
                  leading: Icon(
                    Icons.stacked_line_chart,
                    size: 30,
                    color: Colors.black,
                  ),
                  title: Text(
                    "5.6",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Nota média"),
                )
              ])),
        ],
      ),
    );
  }
}
