import 'package:flame_jam1/game_world.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'game_world.dart';

class GameWorldPage extends StatefulWidget {
  const GameWorldPage({Key? key}) : super(key: key);

  @override
  State<GameWorldPage> createState() => _GameWorldPageState();
}

class _GameWorldPageState extends State<GameWorldPage> {
  GameWorld game = GameWorld();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [GameWidget(game: game)]),
    );
  }
}
