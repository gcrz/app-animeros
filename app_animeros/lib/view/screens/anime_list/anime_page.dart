import 'package:app_animeros/constants/constants.dart';
import 'package:app_animeros/constants/enums.dart';
import 'package:app_animeros/data/jikan_api_data_provider.dart';
import 'package:app_animeros/logic/manage_db/manage_db_event.dart';
import 'package:app_animeros/logic/manage_db/manage_db_state.dart';
import 'package:app_animeros/logic/manage_db/manage_firebase_db_bloc.dart';
import 'package:app_animeros/model/anime.dart';
import 'package:app_animeros/model/malAnime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimePage extends StatefulWidget {
  // final String animeTitle;
  // final String animeUrlImage;
  final MalAnime malAnime;
  String animeDate;

  AnimePage({Key key, @required this.malAnime, this.animeDate})
      : super(key: key);

  @override
  _AnimePageState createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  Anime anime = Anime();
  double animeScore = 0;
  String status;
  bool isSaveButtonDisabled = true;

  final watchedEpisodes = TextEditingController();

  String formatGenresString(List<dynamic> genres) {
    String returnGenres = '| ';
    genres.forEach((element) {
      returnGenres += GENRES[element['mal_id']] + " | ";
    });
    return returnGenres;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageFirebaseBloc, ManageState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                widget.malAnime.title,
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      animeStatus(),
                      Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                      scoreAndWatched(),
                      Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                      Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                      genreClassification(),
                      buttons(),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }

  Widget animeStatus() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            widget.malAnime.imageUrl,
            width: 200,
            height: 200,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8.0, 8.0, 0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.malAnime.title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.fade,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Status"),
                        DropdownButton<String>(
                          onTap: () {
                            isSaveButtonDisabled = false;
                          },
                          focusColor: Colors.white,
                          value: status,
                          elevation: 5,
                          style: TextStyle(color: Colors.white),
                          iconEnabledColor: Colors.black,
                          items: <String>[
                            'Completei',
                            'Assistindo',
                            'Desisti',
                            'Planejo assistir',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          hint: Text(
                            "Escolha uma opção",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          onChanged: (String value) {
                            setState(() {
                              status = value;
                              anime.status = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget scoreAndWatched() {
    // double animeScore;
    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Episódios assistidos: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    width: 45,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: '0'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        if (int.parse(value) > widget.malAnime.episodes) {
                          value = widget.malAnime.episodes.toString();
                        }
                        anime.watchedEpisodes = int.parse(value);
                      },
                    ),
                  ),
                ),
                Text('/ ${widget.malAnime.episodes}')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Nota",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Slider(
                  min: 0,
                  max: 10,
                  value: animeScore,
                  divisions: 10,
                  label: '$animeScore',
                  onChanged: (double value) {
                    isSaveButtonDisabled = false;
                    setState(() {
                      animeScore = value;
                      anime.score = animeScore.toInt();
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget genreClassification() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Informações Gerais",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                )),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Ano de lançamento: ${widget.animeDate}")),
            // Align(alignment: Alignment.centerLeft, child: Text("Fonte: ${}")),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "Gêneros: ${formatGenresString(widget.malAnime.genres)}")),
          ],
        ),
      ),
    );
  }

  Widget buttons() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: isSaveButtonDisabled
                    ? null
                    : () {
                        anime.malId = widget.malAnime.malId;
                        anime.title = widget.malAnime.title;
                        anime.imageUrl = widget.malAnime.imageUrl;
                        anime.date = widget.malAnime.airingStart;
                        BlocProvider.of<ManageFirebaseBloc>(context)
                            .add(InsertEvent(anime: anime));
                        return showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                    "Suas alterações foram salvadas com sucesso!"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("OK"))
                                ],
                              );
                            });
                      },
                child: Text("Salvar"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  isSaveButtonDisabled = true;
                },
                child: Text("Voltar"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
