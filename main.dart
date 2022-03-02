import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicasflutter/routes/Routes.dart';
import 'package:practicasflutter/screens/HomeScreen.dart';

void main() {
  //CUANDO USE PROVEDERS LLAMARE A AppState
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movies App",
      home: HomeScreen(),
      initialRoute: Routes.initRoute,
      routes: Routes.getRoutes(),
      theme: ThemeData.light()
          .copyWith(appBarTheme: AppBarTheme(color: Colors.indigo)),
    );
  }
}

// SOLO CUANDO USE PROVIDERS
// class AppState extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         // lazy sirve para arrancar directamente el provider si no seria hasta
//         // que lo use
//         ChangeNotifierProvider(create: (_) => MoviesProvider(),lazy: false,)
//       ],
//       child: MyApp(),);
//   }
// }
