
import 'package:inbdiba_0_3/src/pages/home_page.dart';
// import 'package:inbdiba_0_3/src/pages/inicio/maps_page.dart';
import 'package:inbdiba_0_3/src/pref/preferencias.dart';
import 'package:flutter/material.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());

}
   final prefs = new PreferenciasUsuario();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indiba 0.3',
      initialRoute: 'home',
      routes: {
        'home' : (BuildContext context) => HomePage(),
        // 'map' : (BuildContext context) => MapsPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
    );
  }
}