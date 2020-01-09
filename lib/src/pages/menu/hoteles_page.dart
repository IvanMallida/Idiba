import 'package:flutter/material.dart';
import 'package:inbdiba_0_3/src/models/hoteles_model.dart';
import 'package:inbdiba_0_3/src/objetos/color_page.dart';
import 'package:inbdiba_0_3/src/providers/hoteles_provider.dart';
import 'package:inbdiba_0_3/src/widget/hotel.dart';

class HotelesPage extends StatelessWidget {
  // const HotelesPage({Key key}) : super(key: key);

  final String idp;
  HotelesPage({this.idp});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: const Text('Hoteles'),
          backgroundColor: Colorapp(),
        ),
        body: new Center(
          child: new FutureBuilder<List<Hotel>>(
            future: downloadJSON(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Hotel> hotels = snapshot.data;
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