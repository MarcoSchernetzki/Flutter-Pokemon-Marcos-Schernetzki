import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pokeapi/features/detail/detail_page.dart';
import 'package:pokeapi/infrastructure/model/pokeapi.dart';

List<Widget> PokeList(List<Poke>? data, alreadySaved) {
  List<Widget> images = [];

  if (data == null) {
    throw Error();
  }

  for (var item in data) {
    images.add(Card(
        child: Column(
      children: [
        Hero(
            tag: item.name,
            child: Material(
              child: Builder(builder: (context) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => DetailPage(
                            item.name, item.urlImage[0], item.abilities)));
                  },
                  child: Column(
                    children: [
                      Text(item.name),
                      Image.network(
                        item.urlImage[0],
                        width: 170,
                      ),
                      IconButton(
                        onPressed: () {
                          alreadySaved = !alreadySaved;
                        },
                        icon: Icon(
                          alreadySaved ? Icons.favorite : Icons.favorite_border,
                          color: alreadySaved ? Colors.red : null,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ))
      ],
    )));
  }
  return images;
}
