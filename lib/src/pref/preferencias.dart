import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario{
  static final PreferenciasUsuario _instancia =  PreferenciasUsuario._internal();

  factory PreferenciasUsuario(){
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

    initPrefs() async{
    this._prefs = await SharedPreferences.getInstance();
  }
// get 7 set del nombre de usuario
  get nombre{
    return _prefs.getString('nombreU')??'Chilly willy';
  }

  set nombre(String value){
    _prefs.setString('nombreU', value);
  }
// get y set del color principal del tema
  get colorThema{
    return _prefs.getInt('colorT')??1;
  }

  set colorThema(int value){
    _prefs.setInt('colorT', value);
  }
}