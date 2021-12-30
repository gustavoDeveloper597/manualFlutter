
//listas basicas

import 'package:flutter/material.dart';

class Listas1Screen extends StatelessWidget {
  List<Map<String, dynamic>> animales = [
    {'name': 'Toro', 'color': 'blanco,negro'},
    {'name': 'Vaca', 'color': 'blanco,negro'},
    {'name': 'Caballo', 'color': 'negro'}
  ];

  ListTile barrerAnimales(Map<String, dynamic> animal) {
//    Usa listTitle como un li de html que permite formar los items de la lista en general
    return ListTile(
      leading: Icon(Icons.animation), //--------------icono a la derecha puede ser cualquier widget
      title:Text("mi ${animal['name']!} es ${animal['color']}"), //------------un widget que representa el texto
      trailing: Icon(Icons.arrow_right),//--- widget que se coloca en la derecha 
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("List view 1"),
        ),
        body: Container(
          child:
          ListView( //--------------------es el widget que representa la lista
            children: [
              ...animales.map((animal) => this.barrerAnimales(animal)).toList(), //----------recibe una lista en este caso  ... saca los items del array
              Divider(), //-------------------permite crear una linea divisora
              Text('Hola mundo'),
              Divider()
            ],


          ),
        ));
  }
}

//listas con separador 
import 'package:flutter/material.dart';

class Listas2Screen extends StatelessWidget {
  List<Map<String, dynamic>> animales = [
    {'name': 'Paloma', 'color': 'blanco,negro'},
    {'name': 'Gaviota', 'color': 'blanco'},
    {'name': 'Canario', 'color': 'amarillo,blanco'}
  ];

  ListTile barrerAnimales(Map<String, dynamic> animal) {
    print(animal);
    return ListTile(
      leading: Icon(Icons.animation),
      title: Text("mi ${animal['name']!} es ${animal['color']}"),
      trailing: Icon(
        Icons.arrow_right,
        color: Colors.pink,
      ),
      onTap: () {
        print(animal);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("List view 2"),
        // elevation: 20,
        // backgroundColor: Colors.greenAccent,
      ),
      body: Container(
          child: ListView.separated(
              itemBuilder: (context, index) {
                // return Text("${animales[index]['name']} es ${animales[index]['color']}");
                return this.barrerAnimales(animales[index]);
              },
              //_ en parametro es no lo usare
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: animales.length)

          // ListTile(
          //   leading: Icon(Icons.animation),
          //   title: Text("Caballo"),
          // )

          ),
    );
  }
}

