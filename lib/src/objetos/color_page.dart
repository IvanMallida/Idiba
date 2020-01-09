import 'package:flutter/material.dart';
import 'package:inbdiba_0_3/src/pref/preferencias.dart';
  final prefs = new PreferenciasUsuario();

  Color Colorapp(){
    // Rosa
    if(prefs.colorThema==1){
      return Color.fromRGBO(255, 85, 229, 100);
    }
    // Azul
    if(prefs.colorThema==2){
      return Color.fromRGBO(0, 218, 255, 100);
    }
    // Amarillo
    if(prefs.colorThema==3){
      return Color.fromRGBO(236, 184, 16, 100);
    }
    // verda
    if(prefs.colorThema==4){
      return Color.fromRGBO(21, 232, 35, 91);
    }
  }

    Color ColorappSecond(){
    // Rosa
    if(prefs.colorThema==1){
      return Color.fromARGB(100, 255, 85, 229);
    }
    // Azul
    if(prefs.colorThema==2){
      return Color.fromARGB(100, 0, 218, 255);
    }
    // Amarillo
    if(prefs.colorThema==3){
      return Color.fromARGB(100, 236, 184, 16);
    }
    // verda
    if(prefs.colorThema==4){
      return Color.fromARGB(100, 21, 232, 35);
    }
  }