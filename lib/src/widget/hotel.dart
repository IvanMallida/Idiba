
import 'package:flutter/material.dart';
import 'package:inbdiba_0_3/src/models/hoteles_model.dart';
import 'package:inbdiba_0_3/src/objetos/color_page.dart';
import 'package:inbdiba_0_3/src/pages/menu/detalle_hotel_page.dart';





class CustomListView extends StatelessWidget {
  final List<Hotel> hotels;
  final String idp;

  CustomListView(this.hotels,this.idp);

  Widget build(context) {
    return ListView.builder(
      itemCount:hotels.length,
      itemBuilder: (context, int currentIndex) {
        if(hotels[currentIndex].idp == idp){
          return createViewItem(hotels[currentIndex], context);
        }else{
          return Container();
        }
      },
    );
  }

  Widget createViewItem(Hotel hotel, BuildContext context) {
    return new ListTile(
        title: new Card(
          elevation: 5.0,
          child: new Container(
            decoration: BoxDecoration(border: Border.all(color: ColorappSecond())),
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Padding(
                  child: Image.network(hotel.imageUrl,
                  height: 150,
                  width: 150,),
                  padding: EdgeInsets.only(bottom: 8.0),
                ),
                
                       Text(
                        hotel.nombre,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                  
                   Text(
                        "\$"+hotel.costo,
                        style: new TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.right,
                      ),
              ],
            ),
          ),
        ),
        onTap: () {
          //We start by creating a Page Route.
          //A MaterialPageRoute is a modal route that replaces the entire
          //screen with a platform-adaptive transition.
          var route = new MaterialPageRoute(
            builder: (BuildContext context) =>
            new DetalleHotelPage(value: hotel),
          );
          //A Navigator is a widget that manages a set of child widgets with
          //stack discipline.It allows us navigate pages.
          Navigator.of(context).push(route);
        });
  }
}




