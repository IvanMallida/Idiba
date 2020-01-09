import 'package:flutter/material.dart';
import 'package:inbdiba_0_3/src/models/pueblos_model.dart';
import 'package:inbdiba_0_3/src/providers/pueblos_providers.dart';
import 'package:inbdiba_0_3/src/widget/card_pueblos.dart';


class PueblosPage extends StatelessWidget {
  // const PueblosPage({Key key}) : super(key: key);
  final pueblosprovider = PueblosProvider();

  @override
  Widget build(BuildContext context) {
    return _crearListaP();
  }
  Widget _crearListaP(){
    return FutureBuilder<List<Pueblos>>(
      future: pueblosprovider.downloadJSON(),
      builder: ( context, AsyncSnapshot<List> snapshot){
        if (snapshot.hasData){
          List<Pueblos> pblos = snapshot.data;
          return CardPueblos(pueblos: pblos);
        }else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

