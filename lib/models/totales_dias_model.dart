// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TotalesDiasModel {
  final int negocios;
  final int servicios;
  final int productos;
  final int busquedas;
  TotalesDiasModel({
    required this.negocios,
    required this.servicios,
    required this.productos,
    required this.busquedas,
  });

  TotalesDiasModel copyWith({
    int? negocios,
    int? servicios,
    int? productos,
    int? busquedas,
  }) {
    return TotalesDiasModel(
      negocios: negocios ?? this.negocios,
      servicios: servicios ?? this.servicios,
      productos: productos ?? this.productos,
      busquedas: busquedas ?? this.busquedas,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'negocios': negocios,
      'servicios': servicios,
      'productos': productos,
      'busquedas': busquedas,
    };
  }

  factory TotalesDiasModel.fromMap(Map<String, dynamic> map) {
    return TotalesDiasModel(
      negocios: map['negocios'] as int,
      servicios: map['servicios'] as int,
      productos: map['productos'] as int,
      busquedas: map['busquedas'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TotalesDiasModel.fromJson(String source) => TotalesDiasModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TotalesDiasModel(negocios: $negocios, servicios: $servicios, productos: $productos, busquedas: $busquedas)';
  }

  @override
  bool operator ==(covariant TotalesDiasModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.negocios == negocios &&
      other.servicios == servicios &&
      other.productos == productos &&
      other.busquedas == busquedas;
  }

  @override
  int get hashCode {
    return negocios.hashCode ^
      servicios.hashCode ^
      productos.hashCode ^
      busquedas.hashCode;
  }
}
