import 'dart:convert';

import 'package:http/http.dart';
import 'package:inbdiba_0_3/src/models/lugares_model.dart';

Future<List<Lugar>> downloadJSON() async {
  final jsonEndpoint =
      "http://indibaitz.com/IndibaApp/app/obtenerAtractivosTuristicos.php";

  final response = await get(jsonEndpoint);

  if (response.statusCode == 200) {
    List place = json.decode(response.body);
    return place
        .map((place) => new Lugar.fromJson(place))
        .toList();
  } else
    throw Exception('We were not able to successfully download the json data.');
}