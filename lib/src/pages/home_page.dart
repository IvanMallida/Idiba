import 'package:flutter/material.dart';
import 'package:inbdiba_0_3/src/objetos/color_page.dart';

import 'inicio/configuracion_page.dart';
import 'inicio/maps_page.dart';
import 'inicio/pueblos_page.dart';


class HomePage extends StatefulWidget {
  // const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndext = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _callPage(currentIndext),
      bottomNavigationBar: _crearBottonNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.map),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
          builder: (context) => MapaPage()
        ));
        },
        backgroundColor: Colorapp(),
      ),
    );
  }

  Widget _crearBottonNavigationBar(){
    return BottomNavigationBar(
      selectedItemColor: Colors.white,
      backgroundColor: Colorapp(),
      currentIndex: currentIndext,
      onTap: (index){
        setState(() {
          currentIndext =index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon:Icon(Icons.location_city),
          title: Text('Pueblos')
        ),
        BottomNavigationBarItem(
          icon:Icon(Icons.settings),
          title: Text('Configuracion')
        )
      ],
    );
  }

  Widget _callPage(int paginaActual){
    switch(paginaActual){
      case 0: return PueblosPage();
      case 1: return ConfigurationPage();
      default:
        return PueblosPage();
    }
  }


}