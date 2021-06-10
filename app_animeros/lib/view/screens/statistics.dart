import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class UserStatistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Column(
        children: [
          generateTitle(),
          generateWatchedAnimeCard(),
          generateWatchedEpisodesCard(),
          generateWatchedDaysCard(),
          generateMeanScoreCard(),
          generateBarChart()
        ],
      ),
    ));
  }

  Widget generateTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Suas estatísticas",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget generateWatchedAnimeCard() {
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        // color: Colors.green[300],
        color: Color.fromRGBO(30, 250, 51, 1),
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
        ]));
  }

  Widget generateWatchedEpisodesCard() {
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        // color: Colors.green[300],
        color: Color.fromRGBO(30, 250, 51, 1),
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
        ]));
  }

  Widget generateWatchedDaysCard() {
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        // color: Colors.green[300],
        color: Color.fromRGBO(30, 250, 51, 1),
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
        ]));
  }

  Widget generateMeanScoreCard() {
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        // color: Colors.green[300],
        color: Color.fromRGBO(30, 250, 51, 1),
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
        ]));
  }

  Widget generateBarChart() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            "Distribuição de notas",
            style: TextStyle(fontSize: 24),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 240,
            width: 240,
            child: Padding(
              padding: EdgeInsets.only(top: 30),
              child: BarChart(BarChartData(
                  maxY: 10,
                  alignment: BarChartAlignment.center,
                  groupsSpace: 10,
                  barGroups: [
                    BarChartGroupData(x: 1, barsSpace: 2, barRods: [
                      BarChartRodData(
                          y: 5,
                          borderRadius: BorderRadius.circular(10),
                          width: 10)
                    ]),
                    BarChartGroupData(x: 2, barsSpace: 2, barRods: [
                      BarChartRodData(
                          y: 3,
                          borderRadius: BorderRadius.circular(10),
                          width: 10)
                    ]),
                    BarChartGroupData(x: 3, barsSpace: 2, barRods: [
                      BarChartRodData(
                          y: 6,
                          borderRadius: BorderRadius.circular(10),
                          width: 10)
                    ]),
                    BarChartGroupData(x: 4, barsSpace: 2, barRods: [
                      BarChartRodData(
                          y: 4,
                          borderRadius: BorderRadius.circular(10),
                          width: 10)
                    ]),
                    BarChartGroupData(x: 5, barsSpace: 2, barRods: [
                      BarChartRodData(
                          y: 7,
                          borderRadius: BorderRadius.circular(10),
                          width: 10)
                    ]),
                    BarChartGroupData(x: 6, barsSpace: 2, barRods: [
                      BarChartRodData(
                          y: 2,
                          borderRadius: BorderRadius.circular(10),
                          width: 10)
                    ]),
                  ])),
            ),
          ),
        ),
      ],
    );
  }
}
