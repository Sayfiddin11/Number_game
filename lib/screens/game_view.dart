import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/game_cubit.dart';

class GameView extends StatelessWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameCubit(),
      child: MyScaffold(),
    );
  }

  Scaffold MyScaffold() {
    return Scaffold(
      body: BlocConsumer<GameCubit, GameState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, __) {
                    return InkWell(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: CircleAvatar(
                          backgroundColor:
                              context.watch<GameCubit>().colors[__],
                          radius: 33.0,
                          child: Center(
                            child: Text(
                              context.watch<GameCubit>().nums[__].toString(),
                              style: TextStyle(
                                color: context.watch<GameCubit>().textColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        context.read<GameCubit>().changeColor(__);
                      },
                    );
                  },
                  itemCount: context.watch<GameCubit>().nums.length,
                ),
              ),
              ElevatedButton(
                child: const Text("Start game"),
                onPressed: () {
                  context.read<GameCubit>().generateRandom();
                },
              )
            ],
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
