import 'package:app_animeros/data/remote/remote_database.dart';
import 'package:app_animeros/logic/manage_db/manage_db_event.dart';
import 'package:app_animeros/logic/manage_db/manage_db_state.dart';
import 'package:app_animeros/logic/manage_db/manage_remote_db_bloc.dart';
import 'package:app_animeros/model/profile_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserRegister extends StatefulWidget {
  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageRemoteBloc, ManageState>(builder: (context, state) {
      ProfileInfo profileInfo;
      profileInfo = new ProfileInfo();

      return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.indigo,
            scaffoldBackgroundColor: const Color(0xFF56F0C6)),
        home: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 45.0),
                      Text(
                        "Cadastro",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      // TEXTO INFORMANDO PARA COLOCAR O NOME DE USUÁRIO
                      SizedBox(height: 45.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Insira o seu nome de usuário",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ),
                      // INICIO DO TextField DE NOME DE USUÁRIO
                      TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: "Nome de usuário",
                          helperText: "Máximo de 50 caracteres",
                          suffixIcon: Icon(Icons.person),
                        ),
                      ),
                      // TEXTO INFORMANDO PARA COLOCAR O NOME DE E-MAIL
                      SizedBox(height: 25.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Insira seu e-mail",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ),
                      // INICIO DO TextField DE EMAIL
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: "E-mail",
                          suffixIcon: Icon(Icons.alternate_email),
                        ),
                      ),
                      // TEXTO INFORMANDO PARA COLOCAR O NOME DE SENHA
                      SizedBox(height: 25.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Insira sua senha",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ),
                      // INICIO DO TextField DA SENHA
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: "Senha",
                          helperText: "Mínimo de 10 e máximo de 30 caracteres",
                          suffixIcon: Icon(Icons.lock),
                        ),
                      ),
                      /* BOTÃO DE SUBMISSÃO */
                      SizedBox(height: 25.0),
                      ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)))),
                        onPressed: () async {
                          print(profileInfo.toString());
                          profileInfo.username = usernameController.text;
                          profileInfo.email = emailController.text;
                          profileInfo.password = passwordController.text;
                          BlocProvider.of<ManageRemoteBloc>(context)
                              .add(SubmitEvent(profileInfo: profileInfo));
                        },
                        child: Text("Cadastrar"),
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            var response = await DatabaseRemoteServer.helper
                                .getProfileList();

                            String registers = "";
                            for (var register in response[0]) {
                              registers +=
                                  "Nome de usuário: ${register.username}\n";
                              registers += "email: ${register.email}\n";
                              registers += "senha: ${register.password}\n\n";
                            }

                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                      title: Text("Cadastros realizados"),
                                      content: Container(
                                          child: SingleChildScrollView(
                                              child: Text(registers))),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Fechar")),
                                      ]);
                                });
                          },
                          child: Text("Mostrar cadastros"))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
