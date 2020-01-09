// To parse this JSON data, do
//
//     final lugar = lugarFromJson(jsonString);

import 'dart:convert';

Lugar lugarFromJson(String str) => Lugar.fromJson(json.decode(str));

String lugarToJson(Lugar data) => json.encode(data.toJson());

class Lugar {
    String id;
    String idp;
    String ubicacion;
    String img;
    String nombre;

    Lugar({
        this.id,
        this.idp,
        this.ubicacion,
        this.img,
        this.nombre,
    });

    factory Lugar.fromJson(Map<String, dynamic> json) => Lugar(
        id: json["id"],
        idp: json["idp"],
        ubicacion: json["ubicacion"],
        img: "http://indibaitz.com/IndibaApp/imagenes/atractivos/"+json["img"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "idp": idp,
        "ubicacion": ubicacion,
        "img": img,
        "nombre": nombre,
    };
}
