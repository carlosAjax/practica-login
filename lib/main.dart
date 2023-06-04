import 'package:flutter/material.dart';
import 'package:login_dos/pages/home_page.dart';
import 'package:login_dos/pages/login_page.dart';
import 'package:login_dos/pages/registro_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginPage(),
        'registrio': (context) => RegistroPage(),
        'home': (context) => HomePage()
      },
    );
  }
}
