import 'package:flutter/material.dart';
//import 'package:lector_qr_sqllite/providers/scan_list_provider.dart';
import 'package:lector_qr_sqllite/widgets/scan_titles.dart';
//import 'package:provider/provider.dart';

class DireccionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScanTiles(tipo: 'http');

    // este estaba antes, como es igual al de mapas pages ahora se usara un widget personalizado para ahorrar codigo
    // final scanListProvider = Provider.of<ScanListProvider>(context);
    // //cuando se está dentro de un build sienpre el listen debe estar en true
    // //cuando el Provider esta en un método el listen debe estar en false

    // final scans = scanListProvider.scans;

    // return ListView.builder(
    //   itemCount: scans.length,
    //   itemBuilder: (_, i) => ListTile(
    //     leading: Icon(
    //       Icons.home_outlined,
    //       color: Theme.of(context).primaryColor,
    //     ),
    //     title: Text(scans[i].valor),
    //     subtitle: Text(scans[i].id.toString()),
    //     trailing: Icon(
    //       Icons.keyboard_arrow_right,
    //       color: Colors.grey,
    //     ),
    //     onTap: () => print('abrir algo'),
    //   ),
    // );
  }
}
