import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [generateSearchTextField()],
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
}
