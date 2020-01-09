import 'package:flutter/material.dart';
import 'package:inbdiba_0_3/src/models/lugares_model.dart';
import 'package:inbdiba_0_3/src/objetos/color_page.dart';

class CardLugar extends StatelessWidget {
  // const CardPueblos({Key key}) : super(key: key);

  final List<Lugar> lugares;
  final String idp; 

  CardLugar({@required this.lugares,this.idp});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:lugares.length,
      itemBuilder: (context, int currentIndex) {
        if(lugares[currentIndex].idp == idp){
          return cdd(context,lugares[currentIndex]);  
        }else{
          return Container();
        }
      },
    );
  }

  Widget cdd(BuildContext context, Lugar lugar){
    final _screenSize = MediaQuery.of(context).size;
  
    final card = Container( 
     child: Column(
       children: <Widget>[
         FadeInImage(
           image: NetworkImage('${lugar.img}'),
           placeholder: AssetImage('assets/jar-loading.gif'),
           fadeInDuration: Duration( milliseconds: 200,),
           height: 250.0,
           fit: BoxFit.cover,
         ),
         Text('${lugar.nombre}',style: TextStyle(color: Colors.white),),
         Text('${lugar.ubicacion}',style: TextStyle(color: Colors.white),)
       ],
     ),
   );

      return GestureDetector(
      
        child: Container(
        margin: EdgeInsets.only(top: 30.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: ColorappSecond(),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              spreadRadius: 5.0,
              offset: Offset(2.0,0.0)
            )
          ]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: card,
        ),
      ),
    );

  }
  
}