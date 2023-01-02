part of 'poke_bloc.dart';

@immutable
abstract class PokeEvent {}

class HandlerFav extends PokeEvent {
  final Poke poke;
  HandlerFav(this.poke);
}
