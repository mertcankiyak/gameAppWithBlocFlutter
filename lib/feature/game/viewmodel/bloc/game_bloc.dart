import 'package:bloc/bloc.dart';
import 'package:game_with_bloc/feature/game/service/IGamesService.dart';
import 'package:meta/meta.dart';

import '../../model/data_model.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final IGamesService gamesService;
  GameBloc({required this.gamesService}) : super(GameInitialState()) {
    on<GameEvent>((event, emit) async {
      if (event is LoadGameDataEvent) {
        emit(GameLoadingState());
        List<DataModel>? response = await gamesService.getGamesData();
        if (response == null) {
          emit(GameDataErrorState("data error"));
        } else {
          emit(GameLoadedState(response));
        }
      }
    });
  }
}
