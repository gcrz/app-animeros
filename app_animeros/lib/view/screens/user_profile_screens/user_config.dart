import 'package:flutter/material.dart';

class UserConfig extends StatefulWidget {
  @override
  _UserConfigState createState() => _UserConfigState();
}

class _UserConfigState extends State<UserConfig> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ANIMEROS"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          generateTitle(),
          Row(
            children: [
              
            ],
          )
        ],
      )
    );
  }

  Widget generateTitle() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          "Configurações da Conta",
          style: TextStyle(
            fontSize: 30,
            color: Colors.indigo
          )
        ),
      ),
    );
  }

}