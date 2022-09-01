part of 'game_bloc.dart';

@immutable
abstract class GameState {}

class GameInitialState extends GameState {}

class GameLoadingState extends GameState {}

class GameLoadedState extends GameState {
  final List<DataModel?> apiResult;
  GameLoadedState(this.apiResult);
}

class GameDataErrorState extends GameState {
  String? errorMessage;
  GameDataErrorState(this.errorMessage);
}
