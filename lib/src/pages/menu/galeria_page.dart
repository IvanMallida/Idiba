import 'package:flutter/material.dart';
import 'package:inbdiba_0_3/src/models/galeria_model.dart';
import 'package:inbdiba_0_3/src/objetos/color_page.dart';
import 'package:inbdiba_0_3/src/providers/galeria_provider.dart';
import 'package:inbdiba_0_3/src/widget/card_galeria.dart';

class GaleriaPage extends StatelessWidget {

  final String idp;
  GaleriaPage({this.idp});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: const Text('Galería'),
          backgroundColor: Colorapp(),
        ),
        
        body: new Center(
         
          child: new FutureBuilder<List<Galeria>>(
            future: downloadJSON(),
           
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Galeria> gal = snapshot.data;
                return new CardGalerias(fotos: gal,idp:idp);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              //return  a circular progress indicator.
              return new CircularProgressIndicator();
            },
          ),

        ),
      );
  }
}