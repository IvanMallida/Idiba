// To parse this JSON data, do
//
//     final restaurantes = restaurantesFromJson(jsonString);

import 'dart:convert';

Restaurantes restaurantesFromJson(String str) => Restaurantes.fromJson(json.decode(str));

String restaurantesToJson(Restaurantes data) => json.encode(data.toJson());

class Restaurantes {
    String id;
    String idp;
    String nombre;
    String descripcion;
    String dietasEspeciales;
    String rngoPrecios;
    String tposComida;
    String detalles;
    String img;
    String contacto;
    String ubicacion;

    Restaurantes({
        this.id,
        this.idp,
        this.nombre,
        this.descripcion,
        this.dietasEspeciales,
        this.rngoPrecios,
        this.tposComida,
        this.detalles,
        this.img,
        this.contacto,
        this.ubicacion,
    });

    factory Restaurantes.fromJson(Map<String, dynamic> json) => Restaurantes(
        id: json["id"],
        idp: json["idp"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        dietasEspeciales: json["dietas_especiales"],
        rngoPrecios: json["rngo_precios"],
        tposComida: json["tpos_comida"],
        detalles: json["detalles"],
        img: "http://indibaitz.com/IndibaApp/imagenes/restaurantes/"+json["img"],
        contacto: json["contacto"],
        ubicacion: json["ubicacion"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "idp": idp,
        "nombre": nombre,
        "descripcion": descripcion,
        "dietas_especiales": dietasEspeciales,
        "rngo_precios": rngoPrecios,
        "tpos_comida": tposComida,
        "detalles": detalles,
        "img": img,
        "contacto": contacto,
        "ubicacion": ubicacion,
    };
}