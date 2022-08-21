import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame_jam1/game_controller.dart';
import 'package:flame_audio/flame_audio.dart';

class BeeObject extends SpriteComponent
    with HasGameRef, CollisionCallbacks, Tappable {
  bool showBee = false;
  bool _beenPressed = false;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    int value = Random().nextInt(4);
    List<Vector2> positions = [
      Vector2(gameRef.size.x / 2 + 300, gameRef.size.y / 2 - 150),
      Vector2(gameRef.size.x / 2 + 150, gameRef.size.y / 2 - 150),
      Vector2(gameRef.size.x / 2 - 300, gameRef.size.y / 2 - 150),
      Vector2(gameRef.size.x / 2 - 150, gameRef.size.y / 2 - 150)
    ];

    sprite = await gameRef.loadSprite('bee1.png');
    position = positions[value];
    size = Vector2(100, 100);
    if (value == 2 || value == 3) {
      flipHorizontally();
    }
    priority = 4;
    anchor = Anchor.center;
    add(RectangleHitbox()..size = Vector2(100, 100));
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
    print("collidedo");
    GameController.isPlaying = false;
    GameController.resetGame();
    removeFromParent();
    //change game status
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    if (position.y <= gameRef.size.y) {
      // object.position.add(Vector2(dt * _beeSpeed, dt * _beeSpeed));
    }
  }

// move towards player
  void moveTowardsTarget(Vector2 pos) {
    final effect = MoveToEffect(pos, EffectController(duration: 3));

    add(effect);
  }

  @override
  bool onTapUp(_) {
    _beenPressed = false;
    GameController.beeCount -= 1;
    FlameAudio.play('crash-sound-effect.mp3');

    return true;
  }

  @override
  bool onTapDown(_) {
    _beenPressed = true;
    print('remove');
    removeFromParent();

    //decrease

    return true;
  }
}
