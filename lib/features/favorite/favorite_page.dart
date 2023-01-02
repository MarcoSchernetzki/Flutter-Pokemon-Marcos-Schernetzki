import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapi/bloc/user/user_bloc.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (_, state) {
      return state.isUser
          ? const Text('Aun no tiene favoritos')
          : const Center(child: Text('Necesita iniciar sesion para continuar'));
    });
  }
}
