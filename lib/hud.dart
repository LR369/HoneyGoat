import 'package:flame/components.dart';
import 'package:flame_jam1/object_component.dart';
import 'game_controller.dart';
import 'package:flutter/material.dart';
import 'package:flame/palette.dart';

class Hud extends PositionComponent with HasGameRef, Tappable {
  bool _beenPressed = false;
  final TextComponent beeCount = TextComponent();
  final ObjectComponent bee = ObjectComponent('bee1.png');
  final _regularTextStyle =
      TextStyle(fontSize: 18, color: BasicPalette.black.color);
  final TextComponent tapToStartBtn = TextComponent();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    priority = 6;

    bee.position = Vector2(gameRef.size.x - 150, 50);
    bee.size = Vector2(75, 75);
    add(bee);
    beeCount.position = Vector2(gameRef.size.x - 100, 50);
    beeCount.text = "${GameController.beeCount}";
    final regular = TextPaint(style: _regularTextStyle);
    beeCount.textRenderer = regular;
    add(beeCount);

    tapToStartBtn.text = 'Tap to Play';
    tapToStartBtn.position = Vector2(gameRef.size.x / 2, gameRef.size.y / 2);
    add(tapToStartBtn);
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    beeCount.text = "${GameController.beeCount}";

    if (GameController.isPlaying) {
      tapToStartBtn.text = '';
    } else {
      tapToStartBtn.text = 'Tap to Play';
    }
    if (GameController.hasWon) {
      tapToStartBtn.text = 'Goat Saved, You WON!';
      GameController.isPlaying = false;
    }
  }

  @override
  bool onTapUp(_) {
    _beenPressed = false;
    return true;
  }

  @override
  bool onTapDown(_) {
    _beenPressed = true;

    return true;
  }
}
