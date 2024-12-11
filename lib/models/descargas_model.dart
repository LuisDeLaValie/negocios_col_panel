import 'dart:convert';

class Descargamodel {
  final String mes;
  final int descargas;
  Descargamodel({
    required this.mes,
    required this.descargas,
  });

  Descargamodel copyWith({
    String? mes,
    int? descargas,
  }) {
    return Descargamodel(
      mes: mes ?? this.mes,
      descargas: descargas ?? this.descargas,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mes': mes,
      'descargas': descargas,
    };
  }

  factory Descargamodel.fromMap(Map<String, dynamic> map) {
    return Descargamodel(
      mes: map['mes'] as String,
      descargas: map['descargas'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Descargamodel.fromJson(String source) => Descargamodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Descargamodel(mes: $mes, descargas: $descargas)';

  @override
  bool operator ==(covariant Descargamodel other) {
    if (identical(this, other)) return true;
  
    return 
      other.mes == mes &&
      other.descargas == descargas;
  }

  @override
  int get hashCode => mes.hashCode ^ descargas.hashCode;
}