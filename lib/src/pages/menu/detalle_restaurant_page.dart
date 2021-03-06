
import 'package:flutter/material.dart';
import 'package:inbdiba_0_3/src/models/restaurante_model.dart';
import 'package:inbdiba_0_3/src/objetos/color_page.dart';

class DetalleRestaurant extends StatefulWidget {
  final Restaurantes value;

  DetalleRestaurant({Key key, this.value}) : super(key: key);

  @override
  _DetalleRestaurantState createState() => _DetalleRestaurantState();
}

class _DetalleRestaurantState extends State<DetalleRestaurant> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF7A9BEE),
      appBar: new AppBar(
        title: new Text('Detalle Restaurante'),
        backgroundColor: Colorapp(),
      ),
      body: ListView(
        children: <Widget>[
          Stack(children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height -82.0,
              width: MediaQuery.of(context).size.width,
              color: ColorappSecond()
            ),
            Positioned(
              top: 75.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45.0),
                    topRight: Radius.circular(45.0),
                  ),
                  color: Colors.white
                ),
                height: MediaQuery.of(context).size.height -100.0,
                width: MediaQuery.of(context).size.width
              ),
            ),
            Positioned(
              top: 30.0,
              left: (MediaQuery.of(context).size.width/2)-100.0,
              child: Hero(
                tag: widget.value.img,
                child: 
                    Image.network(widget.value.img,
                      fit: BoxFit.cover,
                      height: 200.0,
                      width: 200,
                      ),
                  )
              ),
              Positioned(
                top: 250.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${widget.value.nombre}',
                    style: TextStyle(
                      fontFamily: 'Monserrat',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    )
                    ),
                    SizedBox(height: 20.0,),
                    Column(children: <Widget>[
                      Padding(child: 
                      Text("COMIDA\n"+'${widget.value.tposComida}',
                      style: TextStyle(
                        fontFamily: 'Monserrat',
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      padding: EdgeInsets.only(top: 1.0),
                      )
                    ],
                    ),
                    Column(
                      children: <Widget>[
                      Padding(child: 
                      Text('${widget.value.ubicacion}',
                      style: TextStyle(
                        fontFamily: 'Monserrat',
                        fontSize: 17.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      padding: EdgeInsets.only(top: 10.0),
                      )
                      ]
                      ),
                    Column(
                      children: <Widget>[
                      Padding(child: 
                      Text("RANGO DE PRECIOS | "+'${widget.value.rngoPrecios}',
                      style: TextStyle(
                        fontFamily: 'Monserrat',
                        fontSize: 15.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      padding: EdgeInsets.only(top: 10.0),
                      )
                    ],
                    ),
                    Column(
                      children: <Widget>[
                      Padding(child: 
                      Text("DIETAS ESPECIALES | "+'${widget.value.dietasEspeciales}',
                      style: TextStyle(
                        fontFamily: 'Monserrat',
                        fontSize: 15.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      padding: EdgeInsets.only(top: 10.0),
                      )
                    ],
                    ),
                    Column(
                      children: <Widget>[
                      Padding(child: 
                      Text("CONTACTO | "+'${widget.value.contacto}',
                      style: TextStyle(
                        fontFamily: 'Monserrat',
                        fontSize: 15.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      padding: EdgeInsets.only(top: 10.0),
                      )
                    ],
                    ),
                     Column(
                      children: <Widget>[
                      Padding(child: 
                      Text("DETALLES | "+'${widget.value.detalles}',
                      style: TextStyle(
                        fontFamily: 'Monserrat',
                        fontSize: 15.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      padding: EdgeInsets.only(top: 10.0),
                      )
                    ],
                    )
                  ],
                ),
                )
            
          ],)
        ],
      )
    );
  }
}
