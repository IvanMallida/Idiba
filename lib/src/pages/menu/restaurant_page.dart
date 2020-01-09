import 'package:flutter/material.dart';
import 'package:inbdiba_0_3/src/models/restaurante_model.dart';
import 'package:inbdiba_0_3/src/objetos/color_page.dart';
import 'package:inbdiba_0_3/src/providers/restaurante_provider.dart';
import 'package:inbdiba_0_3/src/widget/restaurante.dart';

class RestaurantPage extends StatelessWidget {

  final String idp;
  RestaurantPage({this.idp});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: const Text('Restaurantes'),
          backgroundColor: Colorapp(),
        ),
        body: new Center(
          //FutureBuilder is a widget that builds itself based on the latest snapshot
          // of interaction with a Future.
          child: new FutureBuilder<List<Restaurantes>>(
            future: downloadJSON(),
            //we pass a BuildContext and an AsyncSnapshot object which is an
            //Immutable representation of the most recent interaction with
            //an asynchronous computation.
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Restaurantes> hotels = snapshot.data;
                return new CustomListView(hotels,idp);
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