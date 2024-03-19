
import 'dart:convert';

List<Cuenta> cuentaFromMap(String str) => List<Cuenta>.from(json.decode(str).map((x) => Cuenta.fromMap(x)));

String cuentaToMap(List<Cuenta> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Cuenta {
    int id;
    int userId;
    String nroCuenta;
    String entidad;
    String moneda;
    String createdAt;
    String updatedAt;

    Cuenta({
        required this.id,
        required this.userId,
        required this.nroCuenta,
        required this.entidad,
        required this.moneda,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Cuenta.fromMap(Map<String, dynamic> json) => Cuenta(
        id: json["id"],
        userId: json["user_id"],
        nroCuenta: json["nro_cuenta"],
        entidad: json["entidad"],
        moneda: json["moneda"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "nro_cuenta": nroCuenta,
        "entidad": entidad,
        "moneda": moneda,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
