import 'dart:ui';
import 'package:flame/game.dart';

class LameTank extends Game {
  Size screenSize;

void render(Canvas c) {
  if (screenSize == null) {
    return;
  }

  c.drawRect(
    Rect.fromLTWH(
      0,
      0,
      screenSize.width,
      screenSize.height,
    ),
    Paint()..color = Color(0xff27ae60),
  );
}

  void update(double t) {}

  void resize(Size size) => screenSize = size;
}
