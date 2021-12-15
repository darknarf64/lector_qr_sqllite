import 'package:flutter/material.dart';
import 'package:lector_qr_sqllite/providers/ui_provider.dart';
import 'package:provider/provider.dart';

class CustomNavigationBar extends StatelessWidget {
  // const CustomNavigationBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProider = Provider.of<UiProvider>(context);

    final curretIndex = uiProider.selectedMenuOpt;
    // para cambiarlo se necesita un gestor de estado
    //el mas popular providers otro el getX, otro el flutter block
    //el provider hay que importarlo desde la pagina de flutter provider

    return BottomNavigationBar(
        onTap: (int i) => uiProider.selectedMenuOpt = i,
        elevation: 0,
        currentIndex: curretIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration),
            label: 'Direcciones',
          ),
        ]);
  }
}
