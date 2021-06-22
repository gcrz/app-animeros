import 'package:app_animeros/logic/manage_auth/auth_bloc.dart';
import 'package:app_animeros/logic/manage_auth/auth_event.dart';
import 'package:app_animeros/view/screens/user_profile_screens/user_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final user = FirebaseAuth.instance.currentUser;
  BuildContext _context;
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Column(
      children: [
        Row(
          children: [profileImage(), profileData()],
        ),
        Divider(),
        accountConfiguration(),
        help(),
        logout()
      ],
    );
  }

  Widget profileData() {
    return Expanded(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "E-mail",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(user.email == null ? 'Usuário anônimo' : user.email,
              style: TextStyle(fontSize: 16)),
        ),
      ]),
    );
  }

  Widget profileImage() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        height: 100,
        width: 100,
        child: Stack(clipBehavior: Clip.none, fit: StackFit.expand, children: [
          Icon(
            Icons.person,
            size: 100,
          ),
        ]),
      ),
    );
  }

  Widget accountConfiguration() {
    return Container(
      height: 60,
      child: TextButton(
        style: TextButton.styleFrom(
            // primary: Colors.black,
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
              _context, MaterialPageRoute(builder: (context) => UserConfig()));
        },
      ),
    );
  }

  Widget help() {
    return Container(
      height: 60,
      child: TextButton(
        style: TextButton.styleFrom(
            // primary: Colors.black,
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
                    content: Text("Informações do aplicativo:\nVersão: 0.0.1"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Sair"))
                    ],
                  ));
        },
      ),
    );
  }

  Widget logout() {
    return ElevatedButton(
        onPressed: () {
          BlocProvider.of<AuthBloc>(context).add(Logout());
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => UserLogin()));
        },
        child: Text("Logout"));
  }
}
