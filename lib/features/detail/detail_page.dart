import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(this.name, this.image, this.ability);
  final String name;
  final String image;
  final String ability;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 240.0,
          child: Hero(
            tag: name,
            child: Material(
                child: Column(
              children: [
                Image.network(image, width: 180),
                Text("Nombre: " + name),
                Text('Habilidad especial: ' + ability)
              ],
            )),
          ),
        )
      ],
    );
  }
}
