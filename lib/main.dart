import 'package:flutter/material.dart';
import 'package:lector_qr_sqllite/pages/home_page.dart';
import 'package:lector_qr_sqllite/pages/mapa_page.dart';
import 'package:lector_qr_sqllite/providers/scan_list_provider.dart';
import 'package:lector_qr_sqllite/providers/ui_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider()),
        ChangeNotifierProvider(create: (_) => new ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Lector',
        initialRoute: 'home',
        routes: {
          //rutas o pages
          'home': (BuildContext context) => HomePage(),
          'map': (BuildContext context) => MapaPage(),
        },
        theme: ThemeData(
            primaryColor: Colors.deepPurple,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepPurple)),
      ),
    );
  }
}
