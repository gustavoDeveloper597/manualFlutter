import 'package:curso2/flutterProjects/componentes/src/theme/AppThemes.dart';
import 'package:flutter/material.dart';

class AnimalsCardMejorado extends StatelessWidget {
  String url_image;
  String texto;
  AnimalsCardMejorado({required this.url_image, required this.texto});
      // 'https://cdn.pixabay.com/photo/2016/11/14/04/45/elephant-1822636__340.jpg';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      shadowColor: Colors.redAccent.withOpacity(0.7),
      clipBehavior: Clip.antiAlias,
      elevation: 20,
      child: Column(
        children: [
          // agregar un recurso local es crear una carpeta assets en la raiz
          //agregar el directorio en pubspect.yaml y quitas el comentario de assets
          FadeInImage(
            placeholder: AssetImage('assets/img/cargador.gif'),
            image: NetworkImage(url_image),
            width: double.infinity,
            height: 210,
            fit: BoxFit.cover,
            fadeInDuration: Duration(milliseconds: 300),
          ),
          Container(
            alignment: AlignmentDirectional.centerEnd,
            padding: EdgeInsets.only(right: 20, top: 10, bottom: 10),
            child: Text(this.texto),
          ),
          // SizedBox(height: 40,)
        ],
      ),
    );
  }
}
