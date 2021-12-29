import 'package:flutter/material.dart';

import 'package:lector_qr_sqllite/models/scan_models.dart';
import 'package:lector_qr_sqllite/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

//metodo para que se inserte un nuevo valor
//al inicio no regresaba nada. luego se cambio por el util creado
  Future<ScanModel> nuevoScan(String valor) async {
    final nuevoScans = new ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScans);
    //el nuevoScan asigna un id
    nuevoScans.id = id;
    //aquí se asigna el ID de la base de datos al modelo

    if (this.tipoSeleccionado == nuevoScans.tipo) {
      //condicion para que se muestre en la interfas de usuario si estamos en direcciones o geo location
      this.scans.add(nuevoScans);
      notifyListeners();
    }
    //esta parte se añadió luego de crear el utils
    return nuevoScans;
  }

  // metodo para cargar scans
  cargarScans() async {
    final scans = await DBProvider.db.getTodoslosScans();
    this.scans = [...scans!];
    notifyListeners();
  }

  // metodo para cargar scans por tipo
  cargarScansporTipo(String tipo) async {
    final scans = await DBProvider.db.getScansportipo(tipo);
    this.scans = [...scans!];
    this.tipoSeleccionado = tipo;
    notifyListeners();
  }
  // metodo para borrar todos

  borrarTodos() async {
    await DBProvider.db.deleteAllScan();
    this.scans = [];
    notifyListeners();
  }

  //metodo para borrar scans por id
  borrarScansporID(int id) async {
    await DBProvider.db.deleteScan(id);
    //cargarScansporTipo(this.tipoSeleccionado);
    // notifyListeners(); ya no va porque cargarScansportipo ya lo llama
  }
}
