import 'package:app_animeros/logic/manage_auth/auth_bloc.dart';
import 'package:app_animeros/logic/manage_auth/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:app_animeros/view/bottom_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserRegister extends StatefulWidget {
  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final GlobalKey<FormState> formKey = new GlobalKey();
  final RegisterUser registerData = new RegisterUser();

  @override
  Widget build(BuildContext context) {
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
                child: Form(
                  key: formKey,
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
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: "Nome de usuário",
                          helperText: "Máximo de 50 caracteres",
                          suffixIcon: Icon(Icons.person),
                        ),
                        validator: (String inValue) {
                          if (inValue.length == 0) {
                            return "Please enter username";
                          }
                          return null;
                        },
                        onSaved: (String inValue) {
                          registerData.nickname = inValue;
                        },
                      ),
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
                      TextFormField(
                        initialValue: "",
                        keyboardType: TextInputType.emailAddress,
                        validator: (String inValue) {
                          if (inValue.length == 0) {
                            return "Por favor, digite o e-mail";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: "E-mail",
                          suffixIcon: Icon(Icons.alternate_email),
                        ),
                        onSaved: (String inValue) {
                          registerData.username = inValue;
                        },
                      ),
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
                      TextFormField(
                        initialValue: "",
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: "Senha",
                          helperText: "Mínimo de 3 e máximo de 30 caracteres",
                          suffixIcon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                        validator: (String inValue) {
                          if (inValue.length < 3) {
                            return "Senha deve ter 3 ou mais caracteres";
                          }
                          return null;
                        },
                        onSaved: (String inValue) {
                          registerData.password = inValue;
                        },
                      ),
                      SizedBox(height: 25.0),
                      ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)))),
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            formKey.currentState.save();
                            BlocProvider.of<AuthBloc>(context)
                                .add(registerData);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             MyBottomNavigationBar()));
                          }
                        },
                        child: Text("Cadastrar"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
