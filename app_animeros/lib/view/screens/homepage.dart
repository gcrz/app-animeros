import 'package:app_animeros/data/jikan_api_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_animeros/view/screens/anime_list/anime_page.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:connectivity/connectivity.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  Season seasonalAnimes;
  bool isConected = false;

  void setSeason() async {
    seasonalAnimes =
        await JikanApiDataProvider.helper.getSeason(2020, SeasonType.summer);
  }

  void checkConnection() async {
    var connectResult = await Connectivity().checkConnectivity();
    if (connectResult == ConnectivityResult.mobile ||
        connectResult == ConnectivityResult.wifi) {
      isConected = true;
      print("isConnected: " + isConected.toString());
    } else {
      isConected = false;
      print("isConnected: " + isConected.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    setSeason();
    checkConnection();
    return Center(
        child: Column(
      children: [
        generateTitle(),
        generateSeasonalAnimeList(),
      ],
    ));
  }

  String filterSeasonName(String englishSeasonName) {
    String brName;
    if (englishSeasonName == "Spring") {
      brName = "Primavera";
    } else if (englishSeasonName == "Summer") {
      brName = "Verão";
    } else if (englishSeasonName == "Winter") {
      brName = "Inverno";
    } else if (englishSeasonName == "Fall") {
      brName = "Outono";
    }
    return brName;
  }

  Widget generateTitle() {
    String title;
    String year;
    try {
      title = filterSeasonName(seasonalAnimes.seasonName);
      year = seasonalAnimes.seasonYear.toString();
    } catch (e) {
      title = "Erro ao puxar a temporada";
      year = "Erro ao puxar o ano";
    }

    return Container(
      margin: EdgeInsets.all(20),
      child: Text(
        title + year,
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }

  Widget generateSeasonalAnimeList() {
    print(DateTime.now());
    print(seasonalAnimes.anime.length);
    return Expanded(
      child: ListView.builder(
          itemCount: 20,
          // ignore: missing_return
          itemBuilder: (context, index) {

            return Container(
              width: 300,
              height: 200,
              padding: EdgeInsets.all(10),
              child: Card(
                  shadowColor: Colors.black,
                  // color: Colors.blue,
                  elevation: 10,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AnimePage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network(
                              seasonalAnimesImages[index],
                              height: 150,
                            ),
                          ),
                          Flexible(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12, bottom: 10),
                                    child: Text(
                                      seasonalAnimes.anime[index].title,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    seasonalAnimes
                                        .anime[index].producers.first.name,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(seasonalAnimes.anime[index].airingStart,
                                      style: TextStyle(fontSize: 16))
                                ]),
                          )
                        ],
                      ),
                    )),
              );
            }
          }),
    );
  }
}
