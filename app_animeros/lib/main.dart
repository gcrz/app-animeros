import 'package:app_animeros/view/intermediate.dart';
import 'package:app_animeros/view/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app_animeros/view/bottom_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/manage_auth/auth_bloc.dart';

// colocar o google-services.json

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntermediateAuth();
  }
}
