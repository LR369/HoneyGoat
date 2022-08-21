import 'package:flame/components.dart';

class MainBackground extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('main_bg.png');
    size = gameRef.size;
    position = gameRef.size / 2;
    anchor = Anchor.center;
    priority = -1;
  }
}
