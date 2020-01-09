import 'package:flutter/material.dart';
import 'package:inbdiba_0_3/src/models/pueblos_model.dart';
import 'package:inbdiba_0_3/src/pages/menu/guia_page.dart';
import 'package:inbdiba_0_3/src/pages/menu/historia_page.dart';
import 'package:inbdiba_0_3/src/pages/menu/mapa_mn_pueblo.dart';

CallPage(String temp, BuildContext context,Pueblos pbo){
    if(temp=='Historia'){
      return Navigator.push(context, 
        MaterialPageRoute(
          builder: (context) => HistoriaPage(
            img: pbo.img,
            historia: pbo.historia,
          )
        )
      );
    }else if(temp=='Guias'){
      return Navigator.push(context, 
        MaterialPageRoute(
          builder: (context) => GuiaPage(
            idp: pbo.id,
          )
        )
      );
    }else if(temp=='Map'){
          return Navigator.push(context, 
            MaterialPageRoute(
              builder: (context) => MapaPuebloPage(
                lat: pbo.lat,
                lon: pbo.lon,
              )
            )
          );
    }
  }