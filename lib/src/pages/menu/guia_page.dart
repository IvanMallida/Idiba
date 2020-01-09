import 'package:flutter/material.dart';
import 'package:inbdiba_0_3/src/models/guias_model.dart';
import 'package:inbdiba_0_3/src/objetos/color_page.dart';
import 'package:inbdiba_0_3/src/providers/guias_provider.dart';
import 'package:url_launcher/url_launcher.dart';
class GuiaPage extends StatelessWidget {
  // const GuiaPage({Key key}) : super(key: key);
  final String idp;

  GuiaPage({this.idp});
  final guiaprovider = GuiasProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorapp(),
        title: Text('Guias'),
      ),
      body: _crearListaP(),
    );
  }

   Widget _crearListaP(){
    return FutureBuilder<List<Guias>>(
      future: guiaprovider.downloadJSON(),
      builder: (context, AsyncSnapshot<List> snapshot){

          if (snapshot.hasData){
          List<Guias> guia = snapshot.data;
          return _cardGuia(guia,context,idp);
        }else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  _cardGuia(List<Guias> guia, BuildContext context, String idp){
    return ListView.builder(
      itemCount: guia.length,
      itemBuilder: (context, int currentIndex){
        if(guia[currentIndex].idp==idp){
          return _listaItems(guia[currentIndex], context, idp);
        }else{
          return Container();
        }
      },
    );

  }

  _listaItems(Guias guia, BuildContext context, String idp) {
    final pantalla = MediaQuery.of(context).size; 
        final tarjeta =  Container(
        height: pantalla.height * 0.35,
        width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(width:5.0),
              FadeInImage(
                image: NetworkImage('http://indibaitz.com/IndibaApp/imagenes/guias/${guia.photo}.jpg'),
                placeholder:  AssetImage('assets/jar-loading.gif'),
                width: 150.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    textosdata('Nombre',guia.nombre),
                    textosdata('Descripcion',guia.descripciom),
                    textosdata('Horario',guia.horario),
                    botones(guia.telefono,guia.correo)
                  ],
                ),
              )
            ],
          ),
      ); 

        return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 5.0,
              offset: Offset(2.0,0.0)
            )
          ]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: tarjeta,
        ),
      );

  }  

  Widget botonxd(IconData icdt,String temp , String data){
    return GestureDetector(
      onTap: (){
        if(temp == 'Call'){
          _launchphone(data);
        }else{
          _launchmail(data);
        }
      },
          child: Column(
        children: <Widget>[
          Icon(icdt, color: ColorappSecond(), size: 30.0,),
        ],
      ),
    );
  }
  _launchphone(String data) async {
  final num = 'tel:+52 1 $data';
  if (await canLaunch(num)) {
    await launch(num);
  } else {
    throw 'Could not launch $num';
  }
  }
  _launchmail(String data) async {
  final mail = 'mailto:$data?subject=Informes&body=Deseo informes de guia';
  if (await canLaunch(mail)) {
    await launch(mail);
  } else {
    throw 'Could not launch $mail';
  }
  }

  Widget botones(String telefono, String correo){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          botonxd(Icons.call,'Call',telefono),
          botonxd(Icons.contact_mail,'Mail',correo)
        ],
      );
  }

  Widget textosdata(String val , String data){
    return Column(
      crossAxisAlignment: 
      CrossAxisAlignment.start,
      children: <Widget>[
        Text(val,style: TextStyle(fontStyle: FontStyle.italic, color: ColorappSecond()),),
        Center(
          child: Text(data),
        )
      ],
    );
  }



}
