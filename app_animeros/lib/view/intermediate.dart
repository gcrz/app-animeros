import 'package:app_animeros/logic/manage_auth/auth_bloc.dart';
import 'package:app_animeros/model/theme_provider.dart';
import 'package:app_animeros/view/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../custom_theme.dart';

class IntermediateAuth extends StatefulWidget {
  @override
  _IntermediateAuthState createState() => _IntermediateAuthState();
}

class _IntermediateAuthState extends State<IntermediateAuth> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) {
      return themeChangeProvider;
    }, child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget child) {
      return BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
          child: MaterialApp(
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: Wrapper(),
          ));
    }));
  }
}
