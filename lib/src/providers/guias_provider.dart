//Future is n object representing a delayed computation.
import 'dart:convert';

import 'package:http/http.dart';
import 'package:inbdiba_0_3/src/models/guias_model.dart';

class GuiasProvider{

  
Future<List<Guias>> downloadJSON() async {
  final jsonEndpoint =
      "http://indibaitz.com/IndibaApp/app/obtenerGuias.php";

  final response = await get(jsonEndpoint);

  if (response.statusCode == 200) {
    List guia= json.decode(response.body);
    return guia
        .map((guias) => new Guias.fromJson(guias))
        .toList();
  } else
    throw Exception('We were not able to successfully download the json data.');
}
}