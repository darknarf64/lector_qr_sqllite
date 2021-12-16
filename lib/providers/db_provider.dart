import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:lector_qr_sqllite/models/scan_models.dart';
export 'package:lector_qr_sqllite/models/scan_models.dart';

class DBProvider {
  //estrutura de un singleton
  static Database _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

//procedimiento geter verifica si ya hay algo el la database o la inicializa
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    // primero el Path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'ScanDB.db');
    //la extención es importante  (db) el nombre varia
    print(path);

    //aqui se crea la base de datos, si por x motivos tubiera que crear nueva tabla incrementar la version en 1
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREAT TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
        ''');
      },
    );
  }

  Future<int> nuevoScanRaw(ScanModel nuevoScan) async {
    //estrae del scanmodel el id, tipo y valor, para insertalo en VALUES
    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;
    //verifica la existencia de la base de datos
    final db = await database;

    final res = await db.rawInsert('''
    INSER INTO Scans(id, tipo, valor)
      VALUES( $id, '$tipo', '$valor')    
    ''');
    return res;
  }

//otra forma de crear un nuevo raw
  Future<int> nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.insert('Scan', nuevoScan.toJson());

    //el res es el ID del último registro insertado
    return res;
  }

//lee un raw
  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>?> getTodoslosScans() async {
    final db = await database;
    final res = await db.query('Scans');
    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

  Future<List<ScanModel>?> getScansportipo(String tipo) async {
    final db = await database;
    final res = await db.rawQuery('''
    SELECT * FROM Scans WHERE tipo = '$tipo'    
    ''');
    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

//actualizar la base de datos
  Future<int?> updateScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.update('Scans', nuevoScan.toJson(),
        where: 'id = ?', whereArgs: [nuevoScan.id]);
    //si no se pone la condicion where se va a actualizar toda la base de datos.
    return res;
  }

  Future<int?> deleteScan(int id) async {
    final db = await database;
    //si solo se deja el 'scans' sin el where se borra toda la base de datos
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int?> deleteAllScan() async {
    final db = await database;
    //esta forma es más rapida
    // final res = await db.delete('Scans');
    // return res;

    //otra forma
    final res = await db.rawDelete('''
    DELETE FROM Scans
    ''');
    return res;
  }
}
