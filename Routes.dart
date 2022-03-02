import 'package:flutter/material.dart';
import 'package:practicasflutter/screens/ConfiguracionScreen.dart';
import 'package:practicasflutter/screens/HomeScreen.dart';


class Menu {
  String path;
  Widget screen;

  Menu({required this.path, required this.screen});
}

class Routes {
  static String initRoute = 'HomeScreen';
  static List<Menu> menu = [
    Menu(path: 'HomeScreen', screen: HomeScreen()),
    Menu(path: 'DetailsScreen', screen: ConfiguracionScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> rutas = {};
    for (var opciones in menu) {
      rutas.addAll({opciones.path: (context) => opciones.screen});
    }
    return rutas;
  }
}
