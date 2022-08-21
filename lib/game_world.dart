import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'game_controller.dart';
import 'package:flame_jam1/backgrounds/main_background.dart';
import 'package:flame_jam1/hud.dart';
import 'package:flame_jam1/player.dart';
import 'package:flame_jam1/world_object_layer.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flame_audio/flame_audio.dart';

class GameWorld extends FlameGame
    with KeyboardEvents, HasTappables, HasCollisionDetection {
  final MainBackground bg = MainBackground();
  final Player player = Player();
  final Hud hud = Hud();
  late final RouterComponent router;

  // @override
  // bool get debugMode => true;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(bg);
    add(player);
    final WorldObjectLayer objectLayer = WorldObjectLayer(player.position);
    add(objectLayer);
    add(hud);
    FlameAudio.loop('music.mp3');

    // add(router = RouterComponent(
    //   routes: {

    //   },
    //   initialRoute: 'splash',
    // ));
  }

//keyboard controls for game
  @override
  KeyEventResult onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isKeyDown = event is RawKeyDownEvent;

    final isSpace = keysPressed.contains(LogicalKeyboardKey.space);
    Direction? keyDirection;
    if (isKeyDown) {
      if (keysPressed.contains(LogicalKeyboardKey.keyA) ||
          keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
        keyDirection = Direction.left;
        print('left');
      } else if (keysPressed.contains(LogicalKeyboardKey.keyD) ||
          keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
        print('right');
        keyDirection = Direction.right;
      } else if (isSpace) {
        if (!GameController.isPlaying) {
          GameController.isPlaying = true;
        }
      }
      if (isKeyDown && keyDirection != null) {
        player.direction = keyDirection;
      } else if (player.direction == keyDirection && keyDirection != null) {
        player.direction = keyDirection;
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }
}
