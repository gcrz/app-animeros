import 'package:flutter/material.dart';
import 'package:app_animeros/view/screens/anime_list/anime_page.dart';

class MyHomePage extends StatelessWidget {
  final seasonalAnimesImages = [
    "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx12679-0zlvLP7KyxjH.png",
    "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx10165-1j2Qn8wIIn5S.png",
    "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx117193-yZUKig9K220H.jpg",
    "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx119661-yHjL0A9oavem.png",
    "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx116588-dZlzrABT4ttC.jpg"
  ];

  final teste = [
    "https://gblobscdn.gitbook.com/spaces%2F-LanYWbVFl837-fblbH8%2Favatar.png?alt=media",
    "https://gblobscdn.gitbook.com/spaces%2F-LanYWbVFl837-fblbH8%2Favatar.png?alt=media",
    "https://gblobscdn.gitbook.com/spaces%2F-LanYWbVFl837-fblbH8%2Favatar.png?alt=media",
    "https://gblobscdn.gitbook.com/spaces%2F-LanYWbVFl837-fblbH8%2Favatar.png?alt=media",
    "https://gblobscdn.gitbook.com/spaces%2F-LanYWbVFl837-fblbH8%2Favatar.png?alt=media",
  ];

  final animeTitles = [
    "Joshiraku",
    "Nichijou",
    "Boku no hero",
    "Re:Zero kara Hajimeru Isekai Seikatsu 2nd Season Part 2",
    "Sentouin, Hakenshimasu!",
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        generateTitle(),
        generateSeasonalAnimeList(),
      ],
    ));
  }

  Widget generateTitle() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Text(
        "Primavera 2021",
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }

  Widget generateSeasonalAnimeList() {
    return Expanded(
      child: ListView.builder(
          // itemCount: seasonalAnimesImages.length,
          // scrollDirection: Axis.horizontal,
          // shrinkWrap: true,
          itemCount: teste.length,
          itemBuilder: (context, index) {
            return Container(
              width: 300,
              height: 200,
              padding: EdgeInsets.all(10),
              child: Card(
                  color: Colors.blue,
                  elevation: 10,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AnimePage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.network(
                          teste[index],
                          width: 225,
                          height: 150,
                        ),
                        Flexible(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: Text(
                                    animeTitles[index],
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  "Studio X",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text("Data de lançamento",
                                    style: TextStyle(fontSize: 18))
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
