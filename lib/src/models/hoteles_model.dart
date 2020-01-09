
class Hotel {
  final String idH,idp;
  final String nombre, imageUrl, ubicacion,tipo,costo,habitaciones;

  Hotel({
    this.idH,
    this.idp,
    this.nombre,
    this.imageUrl,
    this.ubicacion,
    this.tipo,
    this.costo,
    this.habitaciones,

  });

  factory Hotel.fromJson(Map<String, dynamic> jsonData) {
    return Hotel(
      idH: jsonData['idH'],
      idp: jsonData['idP'],
      nombre: jsonData['nombre'],
      ubicacion: jsonData['ubicacion'],
      tipo: jsonData['tipo'],
      costo: jsonData['costo'],
      habitaciones: jsonData['no.habitaciones'],
      imageUrl: "http://indibaitz.com/IndibaApp/imagenes/hoteles/"+jsonData['imagen'],

    );
  }
}

// 