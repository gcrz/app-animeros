import 'package:flutter/material.dart';

class AnimePage extends StatefulWidget {
  @override
  _AnimePageState createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  double animeScore = 0;
  String status;
  bool isSaveButtonDisabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("nome do anime"),
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
                  synopsis(),
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
                child: Text("Ano de lançamento: 2021")),
            Align(alignment: Alignment.centerLeft, child: Text("Fonte:")),
            Align(alignment: Alignment.centerLeft, child: Text("Gêneros:")),
          ],
        ),
      ),
    );
  }

  Widget synopsis() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Sinopse",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                )),
            Align(
                alignment: Alignment.center,
                child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tristique eu ex in semper. Integer auctor ac diam sed porta. Sed malesuada enim eget dapibus egestas. Etiam et malesuada nisl, in ultrices nisi."))
          ],
        ),
      ),
    );
  }

  Widget scoreAndWatched() {
    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Episódios assistidos",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
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

  Widget animeStatus() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "https://gblobscdn.gitbook.com/spaces%2F-LanYWbVFl837-fblbH8%2Favatar.png?alt=media",
            width: 200,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8.0, 8.0, 0),
            child: Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "nome do anime",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "nome do studio",
                    style: TextStyle(fontSize: 15),
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
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
