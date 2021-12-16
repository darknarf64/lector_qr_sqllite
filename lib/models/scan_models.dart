// To parse this JSON data, do
//
//     final scanModel = scanModelFromJson(jsonString);

import 'dart:convert';

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
  ScanModel({
    required this.id,
    required this.tipo,
    required this.valor,
  }) {
    if (this.valor.contains('http')) {
      this.tipo = "http";
    } else {
      this.tipo = "geo";
    }
  }

  int id;
  String tipo;
  String valor;

//recibe un json que es un mapa de strig dynamic y crea una instancia de la clase scanmodel
  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );

//regre un mapa de string dynamic
  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };
}