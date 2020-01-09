import 'package:flutter/material.dart';
import 'package:inbdiba_0_3/src/models/pueblos_model.dart';
import 'package:inbdiba_0_3/src/objetos/color_page.dart';
import 'package:inbdiba_0_3/src/pages/menu/menu_page.dart';
class CardPueblos extends StatelessWidget {
  // const CardPueblos({Key key}) : super(key: key);

  final List<Pueblos> pueblos;

  CardPueblos({@required this.pueblos});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:pueblos.length,
      itemBuilder: (context, int currentIndex) {
        return cdd(context,pueblos[currentIndex]);
        
      },
    );
  }

  Widget cdd(BuildContext context, Pueblos pueblo){
    final _screenSize = MediaQuery.of(context).size;
  
    final card = Container( 
     child: Column(
       
       children: <Widget>[
         FadeInImage(
           image: NetworkImage('http://indibaitz.com/IndibaApp/imagenes/pueblos/${pueblo.img}.jpg'),
           placeholder: AssetImage('assets/jar-loading.gif'),
           fadeInDuration: Duration( milliseconds: 200,),
           height: 200.0,
           fit: BoxFit.cover,
         ),
        //  Image(
        //    image: NetworkImage('https://hollanderdesign.com/app/uploads/2014/12/haven-meadows-2048x1366.jpg'),
        //  ),
         Container(
           padding: EdgeInsets.all(10.0),
           child: Text(pueblo.nombre,style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),)
           )
       ],
     ),
   );

      return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
          builder: (context) => OpcionesPage(
            pbo: pueblo,
        )));
        },
        child: Container(
          margin: EdgeInsets.all(5.0),
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