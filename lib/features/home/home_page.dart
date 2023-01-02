import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapi/bloc/user/user_bloc.dart';
import 'package:pokeapi/infrastructure/model/pokeapi.dart';
import 'package:pokeapi/features/home/poke_list_page.dart';
import 'package:pokeapi/infrastructure/service/repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokeApi? pokes;
  PokeImage? pokeFull;
  Future<List<Poke>>? pokeImage;
  bool alreadySaved = false;
  var isLoaded = false;

  Future<List<Poke>>? getData() async {
    pokes = await Repository().getData();
    List<Poke> pokeInfo = [];

    if (pokes != null) {
      for (var item in pokes!.results) {
        pokeFull = await Repository().getImageData(item.urlImage[0]);

        pokeInfo.add(Poke(
            name: item.name,
            url: item.url,
            urlImage: [pokeFull!.sprites],
            abilities: pokeFull!.abilities));
      }

      setState(() {
        isLoaded = true;
      });
    }
    return pokeInfo;
  }

  @override
  void initState() {
    super.initState();
    pokeImage = getData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (_, state) {
      return state.isUser
          ? FutureBuilder(
              future: pokeImage,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: PokeList(snapshot.data, alreadySaved),
                  );
                }
                ;
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return const Text('error');
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              })
          : const Center(child: Text('Necesita iniciar sesion para continuar'));
    });
  }
}
