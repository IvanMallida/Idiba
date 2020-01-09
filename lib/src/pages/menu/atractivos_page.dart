import 'package:flutter/material.dart';
import 'package:inbdiba_0_3/src/models/lugares_model.dart';
import 'package:inbdiba_0_3/src/objetos/color_page.dart';
import 'package:inbdiba_0_3/src/providers/lugares_provider.dart';
import 'package:inbdiba_0_3/src/widget/card_lugares.dart';

class AtractivoPage extends StatelessWidget {

  final String idp;
  AtractivoPage({this.idp});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: const Text('Atractivos Turisticos'),
          backgroundColor: Colorapp(),
        ),
        body: new Center(
         
          child: new FutureBuilder<List<Lugar>>(
            future: downloadJSON(),
           
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Lugar> lug = snapshot.data;
                return new CardLugar(lugares: lug,idp: idp,);
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