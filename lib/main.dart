import 'package:flutter/material.dart';
import 'package:lector_qr_sqllite/pages/home_page.dart';
import 'package:lector_qr_sqllite/pages/mapa_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Lector',
      initialRoute: 'home',
      routes: {
        //rutas o pages
        'home': (BuildContext context) => HomePage(),
        'map': (BuildContext context) => MapaPage(),
      },
    );
  }
}
