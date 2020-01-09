import 'package:flutter/material.dart';
import 'package:inbdiba_0_3/src/objetos/color_page.dart';

class HistoriaPage extends StatelessWidget {
  // const HistoriaPage({Key key}) : super(key: key);
  final String img;
  final String historia;

  HistoriaPage({this.img,this.historia});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppbar(img),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height:10.0),
              _descripcion(historia)
            ]),
          )
        ],
      ),
    );
  }

  Widget _descripcion(String historia){
    return Container(
      padding:EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
      child: Text(
        historia,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _crearAppbar(String img){
    return SliverAppBar(
      backgroundColor: Colorapp(),
      elevation: 2.0,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          'Historia',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: NetworkImage('http://indibaitz.com/IndibaApp/imagenes/pueblos/$img.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}