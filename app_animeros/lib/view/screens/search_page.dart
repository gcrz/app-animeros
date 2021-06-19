import 'package:app_animeros/data/jikan_api_data_provider.dart';
import 'package:flutter/material.dart';

import 'anime_list/anime_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();

  List animeList = [];
  String query;

  void search() async {
    this.query = searchController.text;
    animeList = await JikanApiDataProvider.helper.getSearchAsList(this.query);
    setState(() {});
  }

  String getCorrectFormatDate(String date) {
    String _date = date.split("T")[0];
    List<String> dayMonthYear = _date.split("-");
    String correctDate =
        "${dayMonthYear[2]}/${dayMonthYear[1]}/${dayMonthYear[0]}";
    return correctDate;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          generateSearchTextField(),
          generateSearchButton(),
          generateSeasonalAnimeList()
        ],
      ),
    );
  }

  Widget generateSearchTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: searchController,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 2),
            hintText: "Procurar anime",
            prefixIcon: Icon(Icons.search),
            suffixIcon: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                searchController.text = "";
                FocusScope.of(context).unfocus();
              },
            )),
      ),
    );
  }

  Widget generateSearchButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: Text("Pesquisar"),
        onPressed: () {
          search();
        },
      ),
    );
  }

  Widget generateSeasonalAnimeList() {
    return Expanded(
      child: ListView.builder(
          itemCount: animeList.length,
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
                              animeList[index].imageUrl,
                              height: 150,
                              width: 110,
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
                                    animeList[index].title,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                    animeList[index].startDate == null
                                        ? "Não lançado"
                                        : getCorrectFormatDate(
                                            animeList[index].startDate),
                                    style: TextStyle(fontSize: 16))
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
