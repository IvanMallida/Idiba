// To parse this JSON data, do
//
//     final pueblos = pueblosFromJson(jsonString);

import 'dart:convert';

List<Pueblos> pueblosFromJson(String str) => List<Pueblos>.from(json.decode(str).map((x) => Pueblos.fromJson(x)));

String pueblosToJson(List<Pueblos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pueblos {
    String id;
    String nombre;
    String historia;
    String lat;
    String lon;
    String img;

    Pueblos({
        this.id,
        this.nombre,
        this.historia,
        this.lat,
        this.lon,
        this.img,
    });

    factory Pueblos.fromJson(Map<String, dynamic> json) => Pueblos(
        id: json["id"],
        nombre: json["nombre"],
        historia: json["historia"],
        lat: json["lat"],
        lon: json["lon"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "historia": historia,
        "lat": lat,
        "lon": lon,
        "img": img,
    };
}
