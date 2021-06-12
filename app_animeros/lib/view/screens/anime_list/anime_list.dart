import 'package:app_animeros/logic/monitor_db/monitor_db_bloc.dart';
import 'package:app_animeros/logic/monitor_db/monitor_db_state.dart';
import 'package:app_animeros/view/screens/anime_list/anime_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAnimeList extends StatelessWidget {
  final animeTitles = [
    "Joshiraku",
    "Nichijou",
    "Boku no hero",
    "Re:Zero kara Hajimeru Isekai Seikatsu 2nd Season Part 2",
    "Sentouin, Hakenshimasu!",
  ];

  final currentAnimeList = [
    "https://gblobscdn.gitbook.com/spaces%2F-LanYWbVFl837-fblbH8%2Favatar.png?alt=media",
    "https://gblobscdn.gitbook.com/spaces%2F-LanYWbVFl837-fblbH8%2Favatar.png?alt=media",
    "https://gblobscdn.gitbook.com/spaces%2F-LanYWbVFl837-fblbH8%2Favatar.png?alt=media",
    "https://gblobscdn.gitbook.com/spaces%2F-LanYWbVFl837-fblbH8%2Favatar.png?alt=media",
    "https://gblobscdn.gitbook.com/spaces%2F-LanYWbVFl837-fblbH8%2Favatar.png?alt=media",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonitorBloc, MonitorState>(
      builder: (context, state) {
        return Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Sua lista de animes",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    )),
              ),
              horizontalClassView(),
              tableTitleAnime(state.animeList),
            ],
          ),
        );
      },
    );
  }

  Widget horizontalClassView() {
    return Container(
      height: 50,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () => {
                      // teste(
                      //     "https://ibcdn.canaltech.com.br/XYTaHZXJZYOEMa_C3-605dhShK8=/1024x0/smart/i376287.jpeg",
                      //     "10",
                      //     "100")
                    },
                child: Text(
                  "Todos",
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () => {
                      // teste(
                      //     "https://ibcdn.canaltech.com.br/XYTaHZXJZYOEMa_C3-605dhShK8=/1024x0/smart/i376287.jpeg",
                      //     "10",
                      //     "100")
                    },
                child: Text(
                  "Completo",
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () => {
                      // teste(
                      //     "https://ibcdn.canaltech.com.br/XYTaHZXJZYOEMa_C3-605dhShK8=/1024x0/smart/i376287.jpeg",
                      //     "10",
                      //     "100")
                    },
                child: Text(
                  "Assistindo",
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () => {
                      // teste(
                      //     "https://ibcdn.canaltech.com.br/XYTaHZXJZYOEMa_C3-605dhShK8=/1024x0/smart/i376287.jpeg",
                      //     "10",
                      //     "100")
                    },
                child: Text(
                  "Desisti",
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () => {
                      // teste(
                      //     "https://ibcdn.canaltech.com.br/XYTaHZXJZYOEMa_C3-605dhShK8=/1024x0/smart/i376287.jpeg",
                      //     "10",
                      //     "100")
                    },
                child: Text(
                  "Planejo assistir",
                )),
          )
        ],
      ),
    );
  }

  // TableRow teste(String imageURL, String score, String watchedEpisodes) {
  //   return TableRow(
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(10),
  //           border: Border.all(color: Colors.black, width: 1.0)),
  //       children: [
  //         Center(
  //             child: Padding(
  //                 padding: EdgeInsets.all(10),
  //                 child: Image.network(
  //                   imageURL,
  //                   width: 10,
  //                   height: 10,
  //                 ))),
  //         Center(
  //             child: Padding(padding: EdgeInsets.all(10), child: Text(score))),
  //         Center(
  //             child: Padding(
  //                 padding: EdgeInsets.all(10), child: Text(watchedEpisodes)))
  //       ]);
  // }

  Widget tableTitleAnime(animeList) {
    // print(animeList[0]);
    return Expanded(
      child: ListView.builder(
        // itemCount: animeTitles.length,
        itemCount: animeList.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => AnimePage()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => AnimePage()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                            child: Image.network(
                              currentAnimeList[index],
                              width: 50,
                              height: 50,
                              semanticLabel: "Imagem de $animeTitles[index]",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              animeTitles[index],
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text("Episódios assistidos: ${animeList[index].watchedEpisodes.toString()}"),
                          Text("Nota: ${animeList[index].score.toString()}")
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                height: 2,
                color: Colors.grey,
              )
            ],
          );
        },
      ),
    );
  }
}
