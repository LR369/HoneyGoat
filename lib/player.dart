import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flame_jam1/game_controller.dart';

enum Direction { none, left, right }

class Player extends SpriteComponent with HasGameRef, CollisionCallbacks {
  double _playerSpeed = 30.0;
  Direction direction = Direction.none;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    sprite = await gameRef.loadSprite('player.png');
    size = Vector2(100, 100);
    position = Vector2(gameRef.size.x / 2, gameRef.size.y - 100);
    priority = 5;
    anchor = Anchor.center;
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (!GameController.isPlaying) return;
    movePlayer(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
    print("hit");
    GameController.isPlaying = false;
  }

  void movePlayer(double delta) {
    switch (direction) {
      case Direction.left:
        moveLeft(delta);
        break;
      case Direction.right:
        moveRight(delta);
        break;
      case Direction.none:
        break;
    }
  }

  void moveDown(double delta) {
    position.add(Vector2(0, delta * _playerSpeed));
  }

  void moveUp(double delta) {
    position.add(Vector2(0, delta * -_playerSpeed));
  }

  void moveLeft(double delta) {
    position.add(Vector2(delta * -_playerSpeed, 0));
  }

  void moveRight(double delta) {
    position.add(Vector2(delta * _playerSpeed, 0));
  }

  void stop(double delta) {
    position.add(Vector2(0, 0));
  }

  void onTap() {}
}
