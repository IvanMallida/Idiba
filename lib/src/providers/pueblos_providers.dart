//Future is n object representing a delayed computation.
import 'dart:convert';

import 'package:http/http.dart';
import 'package:inbdiba_0_3/src/models/pueblos_model.dart';

class PueblosProvider{

  
Future<List<Pueblos>> downloadJSON() async {
  final jsonEndpoint =
      "http://indibaitz.com/IndibaApp/app/obtenerPueblos.php";

  final response = await get(jsonEndpoint);

  if (response.statusCode == 200) {
    List pueblos = json.decode(response.body);
    return pueblos
        .map((pueblo) => new Pueblos.fromJson(pueblo))
        .toList();
  } else
    throw Exception('We were not able to successfully download the json data.');
}
}