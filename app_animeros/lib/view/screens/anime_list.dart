import 'package:flutter/material.dart';

class UserAnimeList extends StatelessWidget {
  final animeTitles = [
    "Joshiraku",
    "Nichijou",
    "Boku no hero",
    "Re:Zero kara Hajimeru Isekai Seikatsu 2nd Season Part 2",
    "Sentouin, Hakenshimasu!",
  ];

  final teste1 = [
    "https://gblobscdn.gitbook.com/spaces%2F-LanYWbVFl837-fblbH8%2Favatar.png?alt=media",
    "https://gblobscdn.gitbook.com/spaces%2F-LanYWbVFl837-fblbH8%2Favatar.png?alt=media",
    "https://gblobscdn.gitbook.com/spaces%2F-LanYWbVFl837-fblbH8%2Favatar.png?alt=media",
    "https://gblobscdn.gitbook.com/spaces%2F-LanYWbVFl837-fblbH8%2Favatar.png?alt=media",
    "https://gblobscdn.gitbook.com/spaces%2F-LanYWbVFl837-fblbH8%2Favatar.png?alt=media",
  ];

  @override
  Widget build(BuildContext context) {
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
          tableTitleAnime(),
        ],
      ),
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
                      teste(
                          "https://ibcdn.canaltech.com.br/XYTaHZXJZYOEMa_C3-605dhShK8=/1024x0/smart/i376287.jpeg",
                          "10",
                          "100")
                    },
                child: Text(
                  "Todos",
                  style: TextStyle(color: Colors.black),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () => {
                      teste(
                          "https://ibcdn.canaltech.com.br/XYTaHZXJZYOEMa_C3-605dhShK8=/1024x0/smart/i376287.jpeg",
                          "10",
                          "100")
                    },
                child: Text(
                  "Completo",
                  style: TextStyle(color: Colors.black),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () => {
                      teste(
                          "https://ibcdn.canaltech.com.br/XYTaHZXJZYOEMa_C3-605dhShK8=/1024x0/smart/i376287.jpeg",
                          "10",
                          "100")
                    },
                child: Text(
                  "Assistindo",
                  style: TextStyle(color: Colors.black),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () => {
                      teste(
                          "https://ibcdn.canaltech.com.br/XYTaHZXJZYOEMa_C3-605dhShK8=/1024x0/smart/i376287.jpeg",
                          "10",
                          "100")
                    },
                child: Text(
                  "Desisti",
                  style: TextStyle(color: Colors.black),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () => {
                      teste(
                          "https://ibcdn.canaltech.com.br/XYTaHZXJZYOEMa_C3-605dhShK8=/1024x0/smart/i376287.jpeg",
                          "10",
                          "100")
                    },
                child: Text(
                  "Planejo assistir",
                  style: TextStyle(color: Colors.black),
                )),
          )
        ],
      ),
    );
  }

  TableRow teste(String imageURL, String score, String watchedEpisodes) {
    return TableRow(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 1.0)),
        children: [
          Center(
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Image.network(
                    imageURL,
                    width: 10,
                    height: 10,
                  ))),
          Center(
              child: Padding(padding: EdgeInsets.all(10), child: Text(score))),
          Center(
              child: Padding(
                  padding: EdgeInsets.all(10), child: Text(watchedEpisodes)))
        ]);
  }

  Widget tableTitleAnime() {
    return Expanded(
      child: ListView.builder(
        itemCount: animeTitles.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                        child: Image.network(
                          teste1[index],
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 150,
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.black),
                    // ),
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
                        Text("Nota"),
                        Text("Episódios Assistidos")
                      ],
                    ),
                  )
                ],
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
