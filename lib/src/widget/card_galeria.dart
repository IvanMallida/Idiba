import 'package:flutter/material.dart';
import 'package:inbdiba_0_3/src/models/galeria_model.dart';

class CardGalerias extends StatelessWidget {
  // const CardPueblos({Key key}) : super(key: key);

  final List<Galeria> fotos;
  final String idp;
  CardGalerias({@required this.fotos,this.idp});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:fotos.length,
      itemBuilder: (context, int currentIndex) {

        if(fotos[currentIndex].idp == idp){
          return cdd(context,fotos[currentIndex]);
        }else{
          return Container();
        }
      },
    );
  }

  Widget cdd(BuildContext context, Galeria galeria){
    final _screenSize = MediaQuery.of(context).size;
  
    final card = Container( 
     child: Column(
       children: <Widget>[
         FadeInImage(
           image: NetworkImage('${galeria.img}'),
           placeholder: AssetImage('assets/jar-loading.gif'),
           fadeInDuration: Duration( milliseconds: 200,),
           height: 250.0,
           fit: BoxFit.cover,
         ),
       ],
     ),
   );

      return GestureDetector(
      
        child: Container(
        margin: EdgeInsets.only(top: 30.0),
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
          child: card,
        ),
      ),
    );

  }
  
}