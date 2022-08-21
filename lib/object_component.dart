import 'package:flame/components.dart';

class ObjectComponent extends SpriteComponent with HasGameRef {
  final String name;
  ObjectComponent(this.name);
  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite(name);
    anchor = Anchor.center;
    super.onLoad();
  }
}
