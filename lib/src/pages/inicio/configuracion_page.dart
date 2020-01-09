import 'package:flutter/material.dart';
import 'package:inbdiba_0_3/src/objetos/color_page.dart';
import 'package:inbdiba_0_3/src/pref/preferencias.dart';


class ConfigurationPage extends StatefulWidget {
  // ConfigurationPage({Key key}) : super(key: key);

  @override
  _ConfigurationPageState createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  int colorT = 1;
  String _nombreU = 'Chili Willy';
  TextEditingController _textController ;
  final prefs = new PreferenciasUsuario();

    @override
  void initState() {
    
    super.initState();
    colorT = prefs.colorThema;
    _textController = TextEditingController(text: _nombreU);
  }

    setSelectedRadio(int valor)  {

    prefs.colorThema = valor;
    colorT = valor;
    setState(() {
        
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre del usuario',
              ),
              onChanged: (value){
                prefs.nombre = value;
                setState(() {
                  
                });
              },
            ),
          ),
          Divider(),
           RadioListTile(
            value: 1,
            title: Text('Rosa'),
            groupValue: colorT,
            activeColor: Colorapp(),
            onChanged: setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Azul'),
            groupValue: colorT,
            activeColor: Colorapp(),
            onChanged: setSelectedRadio,
          ),
          RadioListTile(
            value: 3,
            title: Text('Amarillo'),
            groupValue: colorT,
            activeColor: Colorapp(),
            onChanged: setSelectedRadio,
          ),
          RadioListTile(
            value: 4,
            title: Text('verde'),
            groupValue: colorT,
            onChanged: setSelectedRadio,
            activeColor: Colorapp(),
          ),
      ],
      
    );
  }
}