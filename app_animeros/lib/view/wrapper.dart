import 'package:app_animeros/logic/manage_auth/auth_bloc.dart';
import 'package:app_animeros/logic/manage_auth/auth_state.dart';
import 'package:app_animeros/view/bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/register_login_screens/user_login.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) {
        if (state is Authenticated) {
          return MyBottomNavigationBar();
        } else {
          return UserLogin();
        }
      },
      listener: (context, state) {
        if (state is AuthError) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Erro do Servidor"),
                  content: Text("${state.message}"),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Ok"))
                  ],
                );
              });
        }
      },
    );
  }
}