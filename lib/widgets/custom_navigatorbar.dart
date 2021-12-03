import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  // const CustomNavigationBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final curretIndex = 1;

    return BottomNavigationBar(
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
