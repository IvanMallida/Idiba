// To parse this JSON data, do
//
//     final guias = guiasFromJson(jsonString);

import 'dart:convert';

Guias guiasFromJson(String str) => Guias.fromJson(json.decode(str));

String guiasToJson(Guias data) => json.encode(data.toJson());

class Guias {
    String id;
    String idp;
    String nombre;
    String correo;
    String telefono;
    String photo;
    String horario;
    String descripciom;

    Guias({
        this.id,
        this.idp,
        this.nombre,
        this.correo,
        this.telefono,
        this.photo,
        this.horario,
        this.descripciom,
    });

    factory Guias.fromJson(Map<String, dynamic> json) => Guias(
        id: json["id"],
        idp: json["idp"],
        nombre: json["nombre"],
        correo: json["correo"],
        telefono: json["telefono"],
        photo: json["photo"],
        horario: json["horario"],
        descripciom: json["descripciom"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "idp": idp,
        "nombre": nombre,
        "correo": correo,
        "telefono": telefono,
        "photo": photo,
        "horario": horario,
        "descripciom": descripciom,
    };
}
