import 'package:flutter/material.dart';
import 'package:lector_qr_sqllite/pages/direcciones_pages.dart';
import 'package:lector_qr_sqllite/pages/mapas_page.dart';
import 'package:lector_qr_sqllite/providers/scan_list_provider.dart';
import 'package:lector_qr_sqllite/providers/ui_provider.dart';
import 'package:lector_qr_sqllite/widgets/custom_navigatorbar.dart';
import 'package:lector_qr_sqllite/widgets/scan_button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('historial'),
        actions: [
          IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: () {
                Provider.of<ScanListProvider>(context, listen: false)
                    .borrarTodos();
              })
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// body del HomePage que regresa un widget de manera condicional (switch)
class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // opteber el selectedMenuOpt del provider

    final uiProider = Provider.of<UiProvider>(context);

    //cambiar para mostrar la página respectiva
    final currentIndext = uiProider.selectedMenuOpt;

    //usar el scanlistprovider (esta parte se escribio cuando ya esta el privder y scanslist)
    final scanlistprivider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndext) {
      case 0:
        scanlistprivider.cargarScansporTipo('geo');
        return MapasPage();
      case 1:
        scanlistprivider.cargarScansporTipo('http');
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }
}
