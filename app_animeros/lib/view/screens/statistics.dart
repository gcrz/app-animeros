import 'dart:math';

import 'package:app_animeros/logic/monitor_db/monitor_db_bloc.dart';
import 'package:app_animeros/logic/monitor_db/monitor_db_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserStatistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonitorBloc, MonitorState>(
      builder: (context, state) {
        return SingleChildScrollView(
            child: Center(
          child: Column(
            children: [
              generateTitle(),
              generateWatchedAnimeCard(state.animeList),
              generateWatchedEpisodesCard(state.animeList),
              generateWatchedDaysCard(state.animeList),
              generateMeanScoreCard(state.animeList),
              generateBarChart(state.animeList)
            ],
          ),
        ));
      },
    );
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

  Widget generateWatchedAnimeCard(animeList) {
    String watched = animeList.length.toString();
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        // color: Colors.green[300],
        color: Color.fromRGBO(30, 250, 51, 1),
        elevation: 5,
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.tv_sharp,
              size: 30,
              color: Colors.black,
            ),
            title: Text(
              "$watched",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Animes assistidos"),
          )
        ]));
  }

  Widget generateWatchedEpisodesCard(animeList) {
    String watchedEpisodes = calculateWatchedEpisodes(animeList).toString();
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        // color: Colors.green[300],
        color: Color.fromRGBO(30, 250, 51, 1),
        elevation: 5,
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.play_arrow,
              size: 30,
              color: Colors.black,
            ),
            title: Text(
              "$watchedEpisodes",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Episódios assistidos"),
          )
        ]));
  }

  int calculateWatchedEpisodes(list) {
    int episodes = 0;
    for (var i = 0; i < list.length; i++) {
      episodes += list[i].watchedEpisodes;
      print(episodes);
    }
    return episodes;
  }

  Widget generateWatchedDaysCard(animeList) {
    String watchedDays = calculateWatchedDays(animeList).toStringAsFixed(1);
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        // color: Colors.green[300],
        color: Color.fromRGBO(30, 250, 51, 1),
        elevation: 5,
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.calendar_today,
              size: 30,
              color: Colors.black,
            ),
            title: Text(
              "$watchedDays",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Dias assistidos"),
          )
        ]));
  }

  double calculateWatchedDays(list) {
    double time = 0.0;
    for (var i = 0; i < list.length; i++) {
      time += list[i].watchedEpisodes * 24;
    }
    double days = time / 1440;
    return days;
  }

  Widget generateMeanScoreCard(animeList) {
    String meanScore = calculateMeanScore(animeList).toString();
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        // color: Colors.green[300],
        color: Color.fromRGBO(30, 250, 51, 1),
        elevation: 5,
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.stacked_line_chart,
              size: 30,
              color: Colors.black,
            ),
            title: Text(
              "$meanScore",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Nota média"),
          )
        ]));
  }

  double calculateMeanScore(list) {
    double mean = 0;
    for (var i = 0; i < list.length; i++) {
      mean += list[i].score;
    }
    return mean / list.length;
  }

  Widget generateBarChart(list) {
    List<double> score = calculateEachScore(list);
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
            height: 250,
            width: 260,
            child: Padding(
              padding: EdgeInsets.only(top: 30),
              child: BarChart(BarChartData(
                  maxY: score.reduce(max) + 5,
                  alignment: BarChartAlignment.center,
                  groupsSpace: 10,
                  borderData: FlBorderData(show: true),
                  barTouchData: BarTouchData(
                      enabled: false,
                      touchTooltipData: BarTouchTooltipData(
                          tooltipBgColor: Colors.transparent,
                          tooltipPadding: const EdgeInsets.all(1))),
                  titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: SideTitles(showTitles: true, margin: 20)),
                  barGroups: [
                    BarChartGroupData(
                        x: 1,
                        barsSpace: 2,
                        barRods: [
                          BarChartRodData(
                              y: score[0],
                              borderRadius: BorderRadius.circular(10),
                              width: 10)
                        ],
                        showingTooltipIndicators: score[0] != 0 ? [0] : [1]),
                    BarChartGroupData(
                        x: 2,
                        barsSpace: 2,
                        barRods: [
                          BarChartRodData(
                              y: score[1],
                              borderRadius: BorderRadius.circular(10),
                              width: 10)
                        ],
                        showingTooltipIndicators: score[1] != 0 ? [0] : [1]),
                    BarChartGroupData(
                        x: 3,
                        barsSpace: 2,
                        barRods: [
                          BarChartRodData(
                              y: score[2],
                              borderRadius: BorderRadius.circular(10),
                              width: 10)
                        ],
                        showingTooltipIndicators: score[2] != 0 ? [0] : [1]),
                    BarChartGroupData(
                        x: 4,
                        barsSpace: 2,
                        barRods: [
                          BarChartRodData(
                              y: score[3],
                              borderRadius: BorderRadius.circular(10),
                              width: 10)
                        ],
                        showingTooltipIndicators: score[3] != 0 ? [0] : [1]),
                    BarChartGroupData(
                        x: 5,
                        barsSpace: 2,
                        barRods: [
                          BarChartRodData(
                              y: score[4],
                              borderRadius: BorderRadius.circular(10),
                              width: 10)
                        ],
                        showingTooltipIndicators: score[4] != 0 ? [0] : [1]),
                    BarChartGroupData(
                        x: 6,
                        barsSpace: 2,
                        barRods: [
                          BarChartRodData(
                              y: score[5],
                              borderRadius: BorderRadius.circular(10),
                              width: 10)
                        ],
                        showingTooltipIndicators: score[5] != 0 ? [0] : [1]),
                    BarChartGroupData(
                        x: 7,
                        barsSpace: 2,
                        barRods: [
                          BarChartRodData(
                              y: score[6],
                              borderRadius: BorderRadius.circular(10),
                              width: 10)
                        ],
                        showingTooltipIndicators: score[6] != 0 ? [0] : [1]),
                    BarChartGroupData(
                        x: 8,
                        barsSpace: 2,
                        barRods: [
                          BarChartRodData(
                              y: score[7],
                              borderRadius: BorderRadius.circular(10),
                              width: 10)
                        ],
                        showingTooltipIndicators: score[7] != 0 ? [0] : [1]),
                    BarChartGroupData(
                        x: 9,
                        barsSpace: 2,
                        barRods: [
                          BarChartRodData(
                              y: score[8],
                              borderRadius: BorderRadius.circular(10),
                              width: 10)
                        ],
                        showingTooltipIndicators: score[8] != 0 ? [0] : [1]),
                    BarChartGroupData(
                        x: 10,
                        barsSpace: 2,
                        barRods: [
                          BarChartRodData(
                              y: score[9],
                              borderRadius: BorderRadius.circular(10),
                              width: 10)
                        ],
                        showingTooltipIndicators: score[9] != 0 ? [0] : [1]),
                  ])),
            ),
          ),
        ),
      ],
    );
  }

  List<double> calculateEachScore(list) {
    List<double> generalScore = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    for (int i = 0; i < list.length; i++) {
      int index = list[i].score;
      generalScore[index - 1] += 1;
    }

    return generalScore;
  }
}
