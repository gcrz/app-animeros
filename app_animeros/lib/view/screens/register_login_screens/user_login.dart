import 'package:app_animeros/logic/manage_auth/auth_bloc.dart';
import 'package:app_animeros/logic/manage_auth/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:app_animeros/view/bottom_navigation_bar.dart';
import 'package:app_animeros/view/screens/register_login_screens/user_register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final GlobalKey<FormState> formKey = new GlobalKey();
  final LoginUser loginData = new LoginUser();

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
                        "Login",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 45.0),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: "Nome de usuário",
                          suffixIcon: Icon(Icons.person),
                        ),
                        initialValue: "",
                        keyboardType: TextInputType.emailAddress,
                        validator: (String inValue) {
                          if (inValue.length == 0) {
                            return "Por favor, digite seu nome de usuário";
                          }
                          return null;
                        },
                        onSaved: (String inValue) {
                          loginData.username = inValue;
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: "Senha",
                          suffixIcon: Icon(Icons.lock),
                        ),
                        initialValue: "",
                        obscureText: true,
                        validator: (String inValue) {
                          if (inValue.length < 3) {
                            return "Senha deve ter 3 caracteres ou mais";
                          }
                          return null;
                        },
                        onSaved: (String inValue) {
                          loginData.password = inValue;
                        },
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)))),
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            formKey.currentState.save();
                            BlocProvider.of<AuthBloc>(context).add(loginData);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             MyBottomNavigationBar()));
                          }
                        },
                        child: Text("Login"),
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side:
                                        BorderSide(color: Color(0xFF5FD14C)))),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserRegister()));
                          },
                          child: Text("Criar conta")),
                      ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side:
                                        BorderSide(color: Color(0xFF5FD14C)))),
                          ),
                          onPressed: () {
                            BlocProvider.of<AuthBloc>(context)
                                .add(LoginAnonymousUser());
                          },
                          child: Text("Login Anônimo"))
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
