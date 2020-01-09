//Future is n object representing a delayed computation.


import 'dart:convert';

import 'package:http/http.dart';
import 'package:inbdiba_0_3/src/models/galeria_model.dart';


Future<List<Galeria>> downloadJSON() async {
  final jsonEndpoint =
      "http://indibaitz.com/IndibaApp/app/obtenerImgPueblos.php";

  final response = await get(jsonEndpoint);

  if (response.statusCode == 200) {
    List fotos = json.decode(response.body);
    return fotos
        .map((foto) => new Galeria.fromJson(foto))
        .toList();
  } else
    throw Exception('We were not able to successfully download the json data.');
}