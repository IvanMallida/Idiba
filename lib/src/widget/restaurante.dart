
import 'package:flutter/material.dart';
import 'package:inbdiba_0_3/src/models/restaurante_model.dart';
import 'package:inbdiba_0_3/src/objetos/color_page.dart';
import 'package:inbdiba_0_3/src/pages/menu/detalle_restaurant_page.dart';






class CustomListView extends StatelessWidget {
  final List<Restaurantes> res;
  final String idp;


  CustomListView(this.res,this.idp);

  Widget build(context) {
    return ListView.builder(
      itemCount:res.length,
      itemBuilder: (context, int currentIndex) {
          if(res[currentIndex].idp == idp){
          return createViewItem(res[currentIndex], context);
        }else{
          return Container();
        }
      },
    );
  }

  Widget createViewItem(Restaurantes restauran, BuildContext context) {
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
                  child: Image.network(restauran.img,
                  height: 150,
                  width: 150,),
                  padding: EdgeInsets.only(bottom: 8.0),
                ),
              
                  Text(
                        restauran.nombre,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),

                  Text(
                        restauran.rngoPrecios,
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
            new DetalleRestaurant(value: restauran),
          );
          //A Navigator is a widget that manages a set of child widgets with
          //stack discipline.It allows us navigate pages.
          Navigator.of(context).push(route);
        });
  }
}


