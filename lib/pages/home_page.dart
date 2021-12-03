import 'package:flutter/material.dart';
import 'package:lector_qr_sqllite/pages/direcciones_pages.dart';
import 'package:lector_qr_sqllite/pages/mapas_page.dart';
import 'package:lector_qr_sqllite/widgets/custom_navigatorbar.dart';
import 'package:lector_qr_sqllite/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('historial'),
        actions: [
          IconButton(icon: Icon(Icons.delete_forever), onPressed: () {})
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //cambiar para mostrar la página respectiva
    final currentIndext = 1;

    switch (currentIndext) {
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }
}
