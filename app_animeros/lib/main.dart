import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app_animeros/view/bottom_navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyBottomNavigationBar();
  }
}
