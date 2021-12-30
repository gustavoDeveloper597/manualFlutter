/*
Puedes hacerlo mediante comando o por tu editor 

si deseas con el editor necesitas usar android studio e instalar algunos plugis para que puedas
usar flutter y simplemente creas un nuevo proyecto o bien por comando: flutter create my_app
*/

//todo proyecto comienza con main 
import 'package:curso2/flutterProjects/componentes/src/routes/AppRoutes.dart';
import 'package:curso2/flutterProjects/componentes/src/theme/AppThemes.dart';
import 'package:flutter/material.dart';

import 'package:curso2/flutterProjects/componentes/src/screens.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: AppRoutes.initialRoute,
    routes: AppRoutes.getRoutes(),
    onGenerateRoute: (settings) => AppRoutes.onGenerateRoute(settings),
    theme:  AppThemes.theme_light
  ));
}
