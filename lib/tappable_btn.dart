import 'package:flame/components.dart';
import 'package:flame_jam1/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:flame/palette.dart';

class TappableBtn extends SpriteComponent with Tappable, HasGameRef {
  bool _beenPressed = false;
  final _regularTextStyle =
      TextStyle(fontSize: 18, color: BasicPalette.white.color);

  TappableBtn()
      : super(
          position: Vector2.all(100),
          size: Vector2(100, 30),
        );

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('btn.png');
    final regular = TextPaint(style: _regularTextStyle);
    add(TextComponent(text: 'Play', textRenderer: regular)
      ..anchor = Anchor.center
      ..position.setFrom(size / 2));
    return super.onLoad();
  }

  @override
  bool onTapUp(_) {
    _beenPressed = false;
    return true;
  }

  @override
  bool onTapDown(_) {
    _beenPressed = true;
    GameController.isPlaying = true;

    return true;
  }
}
