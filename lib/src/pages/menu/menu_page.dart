import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inbdiba_0_3/src/models/pueblos_model.dart';
import 'package:inbdiba_0_3/src/objetos/color_page.dart';
import 'package:inbdiba_0_3/src/pages/menu/atractivos_page.dart';
import 'package:inbdiba_0_3/src/pages/menu/galeria_page.dart';
import 'package:inbdiba_0_3/src/pages/menu/guia_page.dart';
import 'package:inbdiba_0_3/src/pages/menu/historia_page.dart';
import 'package:inbdiba_0_3/src/pages/menu/hoteles_page.dart';
import 'package:inbdiba_0_3/src/pages/menu/mapa_mn_pueblo.dart';
import 'package:inbdiba_0_3/src/pages/menu/restaurant_page.dart';

class OpcionesPage extends StatefulWidget {
  // const OpcionesPage({Key key}) : super(key: key);
  // final dynamic opt;

  final Pueblos pbo;


  OpcionesPage({this.pbo});
  // OpcionesPage({this.opt});

  @override
  _OpcionesPageState createState() => _OpcionesPageState();
}

class _OpcionesPageState extends State<OpcionesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorapp(),
        title: Text(widget.pbo.nombre),
      ),
      body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _botonesredondeados( context)
              ],
            ),
          ),
    );
  }

  Widget _botonesredondeados(BuildContext context){
    return Table(
    
      children: [
        TableRow(
          children: [
            _crearBotonRedondeado(context,Icons.help_outline,'Historia',Colors.blue),
            _crearBotonRedondeado(context,Icons.map,'Map',Colors.purpleAccent),
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(context,  Icons.restaurant_menu, 'Restaurantes',Colors.pinkAccent),
            _crearBotonRedondeado(context,  Icons.assignment_ind, 'Guias',Colors.teal),
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(context, Icons.hotel, 'Hoteles',Colors.blueAccent),
            _crearBotonRedondeado(context,  Icons.terrain, 'Attractivos',Colors.green),
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(context,  Icons.collections, 'Galeria',Colors.red),
            _crearBotonRedondeado(context,  Icons.error_outline, 'Proximamente',Colors.grey),
          ]
        )
      ],
    );
  }

   Widget _crearBotonRedondeado(BuildContext context, IconData icont, String temp,Color colort,){
    final pantalla = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => _calllPage(temp, context),
      child: Container(
        height: pantalla.width*0.35,
        margin: EdgeInsets.all(pantalla.width*0.05),
        decoration: BoxDecoration(
          color: ColorappSecond(),
          
          borderRadius: BorderRadius.circular(20.0)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: colort,
              radius: pantalla.height*0.05,
              child: Icon(icont,color: Colors.white,size: pantalla.width*0.1,),
            ),
            Text(temp,style: TextStyle(color: colort, fontSize: pantalla.width*0.05)),
          ],
        ),
      ),
    );
  }

  _calllPage(String temp, BuildContext context){
    if(temp=='Historia'){
      return Navigator.push(context, 
        MaterialPageRoute(
          builder: (context) => HistoriaPage(
            img: widget.pbo.img,
            historia: widget.pbo.historia,
          )
        )
      );
    }else if(temp=='Guias'){
      return Navigator.push(context, 
        MaterialPageRoute(
          builder: (context) => GuiaPage(
            idp: widget.pbo.id,
          )
        )
      );
    }else if(temp=='Map'){
      return Navigator.push(context, 
        MaterialPageRoute(
          builder: (context) => MapaPuebloPage(
            lat: widget.pbo.lat,
            lon: widget.pbo.lon,
          )
        )
      );
    }else if(temp=='Hoteles'){
      return Navigator.push(context, 
        MaterialPageRoute(
          builder: (context) => HotelesPage(
            idp: widget.pbo.id,
          )
        )
      );
    }else if(temp=='Restaurantes'){
      return Navigator.push(context, 
        MaterialPageRoute(
          builder: (context) => RestaurantPage(
            idp: widget.pbo.id,
          )
        )
      );
    }else if(temp=='Galeria'){
      return Navigator.push(context, 
        MaterialPageRoute(
          builder: (context) => GaleriaPage(
            idp: widget.pbo.id,
          )
        )
      );
    }else if(temp=='Attractivos'){
      return Navigator.push(context, 
        MaterialPageRoute(
          builder: (context) => AtractivoPage(
            idp: widget.pbo.id,
          )
        )
      );
    }
  }
}