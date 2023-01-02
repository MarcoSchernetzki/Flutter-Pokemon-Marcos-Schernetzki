import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokeapi/infrastructure/model/pokeapi.dart';

part 'poke_event.dart';
part 'poke_state.dart';

class PokeBloc extends Bloc<PokeEvent, PokeState> {
  PokeBloc() : super(const PokeInitialState()) {
    on<HandlerFav>((event, emit) {
      emit(PokeSetState(event.poke));
      // TODO: implement event handler
    });
  }
}
