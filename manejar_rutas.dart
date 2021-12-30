
// en el main 
void main() {
  runApp(MaterialApp(
    // home: Listas1Screen(),
    initialRoute: AppRoutes.initialRoute,//---------> ruta inicial
    routes: AppRoutes.getRoutes(),//------------ clase que crea las rutas que es un Map
    onGenerateRoute: (settings) => AppRoutes.onGenerateRoute(settings), //--- Para manejar la ruta por defecto
    
  ));
}

// clase AppRoutes.dart

import 'package:curso2/flutterProjects/componentes/src/models/MenuOpciones.dart';
import 'package:curso2/flutterProjects/componentes/src/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static String initialRoute = 'home'; //---------------------------------ruta inicial

  //---------------------------------------------------------------------para las opciones del ruteador
  static List<MenuOpciones> menuOpciones = [
    MenuOpciones(
        route: 'home', icon: Icons.home, nombre: 'Home', screen: HomeScreen()),
    MenuOpciones(
        route: 'lista1',
        icon: Icons.list_alt,
        nombre: 'ListView Basica',
        screen: Listas1Screen()),
    MenuOpciones(
        route: 'lista2',
        icon: Icons.list_outlined,
        nombre: 'ListView Separate',
        screen: Listas2Screen()),
    MenuOpciones(
        route: 'card',
        icon: Icons.card_giftcard,
        nombre: 'Tarjetas',
        screen: CardScreen()),
    MenuOpciones(
        route: 'alert',
        icon: Icons.add_alert,
        nombre: 'Alertas',
        screen: AlertScreen()),
  ];

 

  static Map<String, Widget Function(BuildContext)> getRoutes() { //------------------funcion que tegresa las rutas 
    Map<String, Widget Function(BuildContext)> rutas = {};
    for (var opciones in menuOpciones) {
      rutas.addAll({opciones.route: (context) => opciones.screen});
    }

    return rutas;
  }

  static Route<dynamic>? Function(RouteSettings) onGenerateRoute = (settings) {
    print(settings);
    return MaterialPageRoute(builder: (context) {
      return HomeScreen();
    });
  };
}
