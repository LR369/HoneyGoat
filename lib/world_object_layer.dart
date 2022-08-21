import 'package:flame/components.dart';
import 'package:flame_jam1/game_controller.dart';

import 'bee_object.dart';

class WorldObjectLayer extends PositionComponent with HasGameRef {
  Vector2 playerPos;
  WorldObjectLayer(this.playerPos);
  List<BeeObject> beeArray = [BeeObject()];
  double releaseBeeTime = 0.85;
  double timepassed = 0;
  double duration = 4;
  final double _beeSpeed = 25.0;
  @override
  Future<void> onLoad() async {
    super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (!GameController.isPlaying) return;
    timepassed += dt;
    releaseBee(timepassed);
    for (var object in beeArray) {
      if (object.position.y >= playerPos.y - 10) {
        print(beeArray.length);
        // object.removeFromParent();
        // object.position.add(Vector2(dt * _beeSpeed, dt * _beeSpeed));
      }
    }

    if (GameController.beeCount == 0) {
      GameController.hasWon = true;
    }
  }

  void createBee() {
    final BeeObject bee = BeeObject();
    add(bee);
    beeArray.add(bee);
    bee.moveTowardsTarget(playerPos);
  }

  void releaseBee(double releaseTime) {
    if (releaseTime > duration) {
      timepassed = 0;
      createBee();
    }
  }
}
