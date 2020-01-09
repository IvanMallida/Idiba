import 'package:http/http.dart';
import 'dart:convert';

import 'package:inbdiba_0_3/src/models/restaurante_model.dart';



//Future is n object representing a delayed computation.


Future<List<Restaurantes>> downloadJSON() async {
  final jsonEndpoint =
      "http://indibaitz.com/IndibaApp/app/obtenerRestaurante.php";

  final response = await get(jsonEndpoint);

  if (response.statusCode == 200) {
    List res = json.decode(response.body);
    return res
        .map((restauran) => new Restaurantes.fromJson(restauran))
        .toList();
  } else
    throw Exception('We were not able to successfully download the json data.');
}