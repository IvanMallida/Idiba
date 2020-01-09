import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:inbdiba_0_3/src/objetos/color_page.dart';
import 'package:latlong/latlong.dart';


class MapaPuebloPage extends StatefulWidget {

  final String lat;
  final String lon;


  MapaPuebloPage({this.lat,this.lon});
  @override
  _MapaPuebloPageState createState() => _MapaPuebloPageState();
}

class _MapaPuebloPageState extends State<MapaPuebloPage> {
  final map = MapController();
  String tipoMapa = 'outdoors';
  @override
  Widget build(BuildContext context) {
    
    widget.lat;
    widget.lon;

    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
        backgroundColor: Colorapp(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: (){},
          )
        ],
      ),
      body: _crearFlutterMap(widget.lat,widget.lon),
      floatingActionButton: _crearBotonFlotante(context),
    );
  }

  Widget _crearFlutterMap(String lat,String lon) {

    return FlutterMap(
      mapController: map,
      options: MapOptions(
        center: LatLng(double.parse(lat),double.parse(lon)),
        zoom: 15
      ),
      layers: [
        _crearMapa(),
      ],
    );

  }

  _crearMapa() {

    return TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/'
      '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
        'accessToken': 'pk.eyJ1IjoiaXZhbm1hbGxpZGEiLCJhIjoiY2szb25xcDU5MXRhMDNubjR5MXRwNzk5NCJ9.6OO_UuXVChAUf8x-bvfZTw',
        'id': 'mapbox.$tipoMapa'
      }
    );


  }
// mapbox://styles/ivanmallida/ck3pdnnwh0a071dpd08k74orw
  // _crearMarcadores(ScanModel scan){
  //   return MarkerLayerOptions(
  //     markers: [
  //       Marker(
  //         width: 100.0,
  //         height:100.0,
  //         point: scan.getLatLng(),
  //         builder: (context) => Container(
  //           child:Icon(
  //             Icons.location_on,
  //             size: 45.0,
  //             color: Theme.of(context).primaryColor,
  //           )
  //         )

  //       )
  //     ]
  //   );
  // }

  Widget _crearBotonFlotante(BuildContext context){

    return FloatingActionButton(
      child: Icon(Icons.repeat),
      backgroundColor: Colorapp(),
      onPressed: (){
        if(tipoMapa == 'dark'){
          tipoMapa = 'light';
        }else if(tipoMapa=='light'){
          tipoMapa='streets';
        }else if(tipoMapa=='streets'){
          tipoMapa='outdoors';
        }else if(tipoMapa=='outdoors'){
          tipoMapa='satellite';
        }else{
          tipoMapa = 'dark';
        }
        setState((){});
      },
    );

  }
}
