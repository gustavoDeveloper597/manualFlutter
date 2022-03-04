import 'package:flutter/material.dart';

class SelectScreen extends StatelessWidget {
  int roll = 1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Select DropDown"),
      ),
      body: Column(
        children: [
          DropdownButtonFormField(
            value: roll.toString(),
            items: [
              DropdownMenuItem(
                child: Text("Super usuario"),
                value: "1",
              ),
              DropdownMenuItem(
                child: Text("Profesor"),
                value: "2",
              ),
            ],
            onChanged: (value) {
              roll = int.parse(value.toString());

            },
          ),
          ElevatedButton(
              onPressed: () {
                print("Mi roll es ${roll}");
              },
              child: Icon(Icons.save))
        ],
      ),
    );
  }
}
