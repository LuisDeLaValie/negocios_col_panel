import 'dart:convert';

class TotalModel {
  final int descargas;
  final int negocios;
  final int negociosPS;
  TotalModel({
    required this.descargas,
    required this.negocios,
    required this.negociosPS,
  });

  TotalModel copyWith({
    int? descargas,
    int? negocios,
    int? negociosPS,
  }) {
    return TotalModel(
      descargas: descargas ?? this.descargas,
      negocios: negocios ?? this.negocios,
      negociosPS: negociosPS ?? this.negociosPS,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'descargas': descargas,
      'negocios': negocios,
      'negociosPS': negociosPS,
    };
  }

  factory TotalModel.fromMap(Map<String, dynamic> map) {
    return TotalModel(
      descargas: map['descargas'].toInt() as int,
      negocios: map['negocios'].toInt() as int,
      negociosPS: map['negociosPS'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TotalModel.fromJson(String source) =>
      TotalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TotalModel(descargas: $descargas, negocios: $negocios, negociosPS: $negociosPS)';

  @override
  bool operator ==(covariant TotalModel other) {
    if (identical(this, other)) return true;

    return other.descargas == descargas &&
        other.negocios == negocios &&
        other.negociosPS == negociosPS;
  }

  @override
  int get hashCode =>
      descargas.hashCode ^ negocios.hashCode ^ negociosPS.hashCode;
}
