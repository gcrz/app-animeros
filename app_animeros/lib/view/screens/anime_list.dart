import 'package:flutter/material.dart';

class UserAnimeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
            child: TextButton(onPressed: () => {teste()}, child: Text("Todos")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                TextButton(onPressed: () => {teste()}, child: Text("Completo")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () => {teste()}, child: Text("Assistindo")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                TextButton(onPressed: () => {teste()}, child: Text("Desisti")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () => {teste()}, child: Text("Planejo assistir")),
          )
        ],
      ),
    );
  }

  Widget teste() {
    return Text("Tô cansado!");
  }

  Widget tableTitleAnime() {
    return Table(
      border: TableBorder(
        top: BorderSide(width: 2),
        bottom: BorderSide(width: 2),
        left: BorderSide(width: 2),
        right: BorderSide(width: 2),
      ),
      children: [
        TableRow(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 1.0)),
            children: [
              Center(
                  child: Padding(
                      padding: EdgeInsets.all(10), child: Text("Anime"))),
              Center(
                  child: Padding(
                      padding: EdgeInsets.all(10), child: Text("Nota"))),
              Center(
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Episódios assistidos")))
            ])
      ],
    );
  }
}
