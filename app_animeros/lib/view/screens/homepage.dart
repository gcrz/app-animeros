import 'package:app_animeros/data/jikan_api_data_provider.dart';
import 'package:app_animeros/model/malAnime.dart';
import 'package:app_animeros/model/season.dart';
import 'package:flutter/material.dart';
import 'package:app_animeros/view/screens/anime_list/anime_page.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Season season;
  List<dynamic> idList;
  String seasonType;
  int seasonYear;

  void setAnimeList(int seasonYear, String seasonType) async {
    JikanApiDataProvider jikan = JikanApiDataProvider.helper;
    season = await jikan.getSeason(seasonYear, seasonType);
    setState(() {});
  }

  String getCorrectFormatDate(String date) {
    String _date = date.split("T")[0];
    List<String> dayMonthYear = _date.split("-");
    String correctDate =
        "${dayMonthYear[2]}/${dayMonthYear[1]}/${dayMonthYear[0]}";
    return correctDate;
  }

  // summer spring fall winter
  String getSeasonString(Season season) {
    String _season = this.seasonType;
    String seasonString = "";
    if (_season == "spring") {
      seasonString += "Primavera ";
    } else if (_season == "summer") {
      seasonString += "Verão ";
    } else if (_season == "fall") {
      seasonString += "Outono ";
    } else if (_season == "winter") {
      seasonString += "Inverno ";
    }
    seasonString += this.seasonYear.toString();
    return seasonString;
  }

  // winter spring summer fall
  void getLastSeason() async {
    if (seasonType == 'winter') {
      this.seasonYear -= 1;
      this.seasonType = "fall";
    } else {
      if (seasonType == 'spring') {
        this.seasonType = "winter";
      } else if (seasonType == 'summer') {
        this.seasonType = 'spring';
      } else if (seasonType == 'fall') {
        this.seasonType = 'summer';
      }
    }

    this.season = await JikanApiDataProvider.helper
        .getSeason(this.seasonYear, this.seasonType);

    setState(() {});
  }

  // winter spring summer fall
  void getNextSeason() async {
    if (seasonType == 'fall') {
      this.seasonYear += 1;
      this.seasonType = "winter";
    } else {
      if (seasonType == 'winter') {
        this.seasonType = "spring";
      } else if (seasonType == 'spring') {
        this.seasonType = 'summer';
      } else if (seasonType == 'summer') {
        this.seasonType = 'fall';
      }
    }

    this.season = await JikanApiDataProvider.helper
        .getSeason(this.seasonYear, this.seasonType);

    setState(() {});
  }

  _MyHomePageState() {
    this.seasonYear = 2020;
    this.seasonType = 'spring';
  }

  @override
  Widget build(BuildContext context) {
    setAnimeList(this.seasonYear, this.seasonType);
    return Center(
        child: Column(
      children: [
        Center(
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 20,
                    ),
                    child: generateBackSeasonButton(),
                  )),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  child: Center(child: generateTitle()),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  child: generateNextSeasonButton(),
                ),
              )
            ],
          ),
        ),
        generateSeasonalAnimeList(),
      ],
    ));
  }

  Widget generateTitle() {
    return Text(
      getSeasonString(season),
      style: TextStyle(
        fontSize: 30,
      ),
    );
  }

  Widget generateBackSeasonButton() {
    return ElevatedButton(
      child: Icon(Icons.arrow_back),
      onPressed: () {
        getLastSeason();
      },
    );
  }

  Widget generateNextSeasonButton() {
    return ElevatedButton(
      child: Icon(Icons.arrow_forward),
      onPressed: () {
        getNextSeason();
      },
    );
  }

  Widget generateSeasonalAnimeList() {
    return Expanded(
      child: ListView.builder(
          itemCount: season.animeList.length,
          itemBuilder: (context, index) {
            return Container(
              width: 300,
              height: 200,
              padding: EdgeInsets.all(10),
              child: Card(
                  shadowColor: Colors.black,
                  elevation: 10,
                  child: InkWell(
                    onTap: () {
                      // season.animeList[index].title;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnimePage(
                                    animeMalId: season.animeList[index].malId,
                                    animeDate: getCorrectFormatDate(
                                        season.animeList[index].airingStart),
                                  )));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: season.animeList == null
                                ? CircularProgressIndicator()
                                : Image.network(
                                    season.animeList[index].imageUrl,
                                    height: 150,
                                  ),
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
                                    season.animeList == null
                                        ? "Carregando"
                                        : season.animeList[index].title,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                    season.animeList == null
                                        ? "Carregando"
                                        : getCorrectFormatDate(season
                                            .animeList[index].airingStart),
                                    style: TextStyle(fontSize: 16)),
                                // TESTE
                                // Text(season.animeList == null
                                //         ? "Carregando"
                                //         : season
                                //             .animeList[index].malId.toString(),
                                //     style: TextStyle(fontSize: 16)),
                              ]),
                        )
                      ],
                    ),
                  )),
            );
          }),
    );
  }
}
