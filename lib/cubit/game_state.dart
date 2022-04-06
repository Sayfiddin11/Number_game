part of 'game_cubit.dart';

@immutable
abstract class GameState {
  const GameState();
}

class GameInitial extends GameState {
  const GameInitial();
}

class NumGenerateFinish extends GameState {
  const NumGenerateFinish();
}

class ChangeColorState extends GameState {
  const ChangeColorState();
}

class ChangeTextColorState extends GameState {
  const ChangeTextColorState();
}
