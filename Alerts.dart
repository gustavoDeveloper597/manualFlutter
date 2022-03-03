import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertasScreen extends StatelessWidget {
  alertaAndroid(BuildContext context) {
    showDialog(
        // barrierColor: Colors.red,
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 10,
            title: Text("Alert android"),
            content: Center(
              child: Column(
                children: [
                  FlutterLogo(
                    size: 20,
                  ),
                  Text("Mi alerta android")
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: () {}, child: Text("Guardar")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cerrar"))
            ],
          );
        });
  }

  alertaIos(BuildContext context) {
    showCupertinoDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            // elevation: 10,
            title: Text("Alert android"),
            content: Center(
              child: Column(
                children: [
                  FlutterLogo(
                    size: 20,
                  ),
                  Text("Mi alerta android")
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: () {}, child: Text("Guardar")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cerrar"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Alertas"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                alertaAndroid(context);
              },
              child: Text("Alert Android")),
          ElevatedButton(
              onPressed: () {
                alertaIos(context);
              },
              child: Text("Alert Ios")),
          ElevatedButton(
              onPressed: () {
                if (Platform.isIOS) {
                  alertaIos(context);
                } else if (Platform.isAndroid) {
                  alertaAndroid(context);
                }
              },
              child: Text("Alert Ios/Android"))
        ],
      ),
    );
  }
}
