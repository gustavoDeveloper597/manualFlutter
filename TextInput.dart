import 'package:flutter/material.dart';

class InputEmail extends StatelessWidget {
  Map<String, dynamic> Formulario;

  InputEmail({required this.FormLogin});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      autofocus: false,
      // initialValue: "",
      keyboardType: TextInputType.emailAddress,
      onChanged: (valor) {
        Formulario['XXXXX'] = valor;
      },
      validator: (valor) {
        if (valor == null || valor.indexOf('@') < 0) {
          return 'No es un usuario valido';
        }
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "ab1d@hotmail.es",
        icon: Icon(Icons.email),
        // suffixIcon: Icon(Icons.alternate_email)
      ),
    );
  }
}
