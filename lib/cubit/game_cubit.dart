import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(const GameInitial());
  int i = 0;
  int count = 0;
  List<int> nums = [];
  List<int> numsSort = [];
  List<Color> colors = [];
  Color textColor = Colors.black;

  generateRandom() {
    bool generate = true;
    i = 0;
    Set<int> numbers = {};
    nums.clear();
    numbers.clear();
    numsSort.clear();
    textColor = Colors.black;
    while (generate) {
      if (numbers.length == 5) {
        generate = false;
        nums.addAll(numbers);
        numsSort.addAll(numbers);
        numsSort.sort();
        emit(const NumGenerateFinish());
      } else {
        int rand = Random().nextInt(10);
        numbers.add(rand);
      }
    }
    colors.clear();
    colors = List.generate(nums.length, (index) => Colors.green);
    changeTextColor();
  }

  changeColor(int index) {
    if (nums[index] == numsSort[i]) {
      i++;
      colors[index] = Colors.transparent;
      if (i == 5) {
        Future.delayed(const Duration(seconds: 3), () => generateRandom());
      }
    } else {
      colors[index] = Colors.red;
    }
    emit(const ChangeColorState());
  }

  changeTextColor() async {
    await Future.delayed(
        const Duration(seconds: 5), () => textColor = Colors.transparent);
    emit(const ChangeTextColorState());
  }
}
