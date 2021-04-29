import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            profileImage(),
            Column(children: [
              Text(
                "Nome do usuário",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Cadastrado desde 29 de março de 2021",
              ),
            ])
          ],
        ),
        Divider(),
        accountConfiguration(),
        help(),
      ],
    );
  }

  Widget profileImage() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        height: 100,
        width: 100,
        child:
            Stack(fit: StackFit.expand, overflow: Overflow.visible, children: [
          CircleAvatar(),
          Positioned(
              right: -10,
              bottom: 0,
              child: SizedBox(
                height: 35,
                width: 35,
                child: TextButton(
                  onPressed: () {},
                  child: Icon(Icons.add_photo_alternate),
                ),
              ))
        ]),
      ),
    );
  }

  Widget accountConfiguration() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.black,
          ),
          onPressed: () {},
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(Icons.build_rounded),
              ),
              Expanded(child: Text("Configurações da Conta")),
              SizedBox(width: 22),
              Icon(Icons.arrow_forward_ios_rounded)
            ],
          )),
    );
  }

  Widget help() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.black,
          ),
          onPressed: () {},
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(Icons.help),
              ),
              Expanded(child: Text("Ajuda")),
              SizedBox(width: 22),
              Icon(Icons.arrow_forward_ios_rounded)
            ],
          )),
    );
  }
}
