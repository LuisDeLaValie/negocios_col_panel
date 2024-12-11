import 'dart:convert';

class Estadisticamodel {
  final String mes;
  final int productos;
  final int servicios;
  Estadisticamodel({
    required this.mes,
    required this.productos,
    required this.servicios,
  });

  Estadisticamodel copyWith({
    String? mes,
    int? productos,
    int? servicios,
  }) {
    return Estadisticamodel(
      mes: mes ?? this.mes,
      productos: productos ?? this.productos,
      servicios: servicios ?? this.servicios,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mes': mes,
      'productos': productos,
      'servicios': servicios,
    };
  }

  factory Estadisticamodel.fromMap(Map<String, dynamic> map) {
    return Estadisticamodel(
      mes: map['mes'] as String,
      productos: map['productos'].toInt() as int,
      servicios: map['servicios'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Estadisticamodel.fromJson(String source) => Estadisticamodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Estadisticamodel(mes: $mes, productos: $productos, servicios: $servicios)';

  @override
  bool operator ==(covariant Estadisticamodel other) {
    if (identical(this, other)) return true;
  
    return 
      other.mes == mes &&
      other.productos == productos &&
      other.servicios == servicios;
  }

  @override
  int get hashCode => mes.hashCode ^ productos.hashCode ^ servicios.hashCode;
}