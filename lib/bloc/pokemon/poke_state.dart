part of 'poke_bloc.dart';

@immutable
abstract class PokeState {
  final bool isFav;

  const PokeState({this.isFav = false});
}

class PokeInitialState extends PokeState {
  const PokeInitialState() : super(isFav: false);
}

class PokeSetState extends PokeState {
  final Poke newFav;
  const PokeSetState(this.newFav) : super(isFav: true);
}
