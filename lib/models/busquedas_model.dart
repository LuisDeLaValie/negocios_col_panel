import 'dart:convert';

class Busquedamodel {
  final String mes;
  final int busquedas;
  Busquedamodel({
    required this.mes,
    required this.busquedas,
  });

  Busquedamodel copyWith({
    String? mes,
    int? busquedas,
  }) {
    return Busquedamodel(
      mes: mes ?? this.mes,
      busquedas: busquedas ?? this.busquedas,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mes': mes,
      'busquedas': busquedas,
    };
  }

  factory Busquedamodel.fromMap(Map<String, dynamic> map) {
    return Busquedamodel(
      mes: map['mes'] as String,
      busquedas: map['busquedas'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Busquedamodel.fromJson(String source) => Busquedamodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Busquedamodel(mes: $mes, busquedas: $busquedas)';

  @override
  bool operator ==(covariant Busquedamodel other) {
    if (identical(this, other)) return true;
  
    return 
      other.mes == mes &&
      other.busquedas == busquedas;
  }

  @override
  int get hashCode => mes.hashCode ^ busquedas.hashCode;
}