import 'package:flutter/material.dart';
import 'package:practicasflutter/providers/ConfiguracionProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ConfiguracionProvider provider;


  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ConfiguracionProvider>(context); //AQUI ES DONDE RECUPERAS LOS DATOS DEL PROVIDER
    print(provider.XXX);

    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
      ),
      body: Column(children: [
        .....
      ]),
    );
  }
}
