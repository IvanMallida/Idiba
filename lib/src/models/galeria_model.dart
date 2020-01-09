// To parse this JSON data, do
//
//     final galeria = galeriaFromJson(jsonString);

import 'dart:convert';

Galeria galeriaFromJson(String str) => Galeria.fromJson(json.decode(str));

String galeriaToJson(Galeria data) => json.encode(data.toJson());

class Galeria {
    String idp;
    String img;

    Galeria({
        this.idp,
        this.img,
    });

    factory Galeria.fromJson(Map<String, dynamic> json) => Galeria(
        idp: json["idp"],
        img: "http://indibaitz.com/IndibaApp/imagenes/galeria_pueblos/"+json["img"],
    );

    Map<String, dynamic> toJson() => {
        "idp": idp,
        "img": img,
    };
}