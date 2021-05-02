import 'package:app_animeros/view/screens/user_profile_screens/user_config.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  BuildContext _context;
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Column(
      children: [
        Row(
          children: [
            profileImage(),
            profileData()
          ],
        ),
        Divider(),
        accountConfiguration(),
        help(),
      ],
    );
  }
  Widget profileData() {
    return Expanded(
          child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Nome de Usuário",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Usuário cadastrado em 30 de Abril de 2021",
                style: TextStyle(
                  fontSize: 16
                )
              ),
            ),
          ]
        ),
    );
  }

  Widget profileImage() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        height: 100,
        width: 100,
        child:
          Stack(
            clipBehavior: Clip.none, fit: StackFit.expand, 
            children: [
            CircleAvatar(),
            Positioned(
                right: -10,
                bottom: 0,
                child: SizedBox(
                  height: 35,
                  width: 35,
                  child: TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.add_photo_alternate,
                      color: Colors.black,
                    ),
                  ),
                ))
          ]
        ),
      ),
    );
  }

  Widget accountConfiguration() {
    return Container(
      height: 60,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.black,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.build_rounded),
            ),
            Expanded(child: Text("Configurações da Conta")),
            SizedBox(width: 22),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(Icons.arrow_forward_ios_rounded),
            )
          ],
        ),
        onPressed: () {
          Navigator.push(
            _context,
            MaterialPageRoute(builder: (context) => UserConfig())
          );
        },
      ),
    );
  }

  Widget help() {
    return Container(
      height: 60,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.black,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.help),
            ),
            Expanded(child: Text("Ajuda")),
            SizedBox(width: 22),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(Icons.arrow_forward_ios_rounded),
            )
          ],
        ),
        onPressed: () {
          showDialog(
            context: _context, 
            builder: (context) => AlertDialog(
              title: Text("Ajuda"),
              content: Text("Informações do aplicativo"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, 
                  child: Text("Sair")
                )
              ],
            )
          );
        },
      ),
    );
  }
}

