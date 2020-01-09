import 'package:http/http.dart';
import 'dart:convert';

import 'package:inbdiba_0_3/src/models/hoteles_model.dart';


//Future is n object representing a delayed computation.


Future<List<Hotel>> downloadJSON() async {
  final jsonEndpoint =
      "http://indibaitz.com/IndibaApp/app/obtenerHoteles.php";

  final response = await get(jsonEndpoint);

  if (response.statusCode == 200) {
    List hotels = json.decode(response.body);
    return hotels
        .map((hotel) => new Hotel.fromJson(hotel))
        .toList();
  } else
    throw Exception('We were not able to successfully download the json data.');
}