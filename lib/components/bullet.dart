import 'dart:math';
import 'dart:ui';
import 'package:lame_tank/helpers/directions.dart';
import 'package:lame_tank/lame-tank.dart';

class Bullet {
  final LameTank game;
  final double speed = 300;
  Offset position;
  Direction direction = Direction.up;
  bool isOffscreen = false;

  Bullet(this.game, {this.position, this.direction});

  void render(Canvas c) {
    c.save();
    c.translate(position.dx, position.dy);

    // rotate the canvas
    switch (direction) {
      case Direction.up:
        c.rotate(0);
        break;
      case Direction.right:
        c.rotate(pi / 2);
        break;
      case Direction.down:
        c.rotate(pi);
        break;
      case Direction.left:
        c.rotate(pi * 3 / 2);
        break;
    }

    c.drawRect(
      Rect.fromLTWH(-3, -6, 6, 16),
      Paint()..color = Color(0xffff0000),
    );

    c.restore();
  }

  void update(double t) {
    if (isOffscreen) {
      return;
    }

    switch (direction) {
      case Direction.up:
        position = position.translate(0, -speed * t);
        if (position.dy < -50) {
          isOffscreen = true;
        }
        break;
      case Direction.right:
        position = position.translate(speed * t, 0);
        if (position.dx > game.screenSize.width + 50) {
          isOffscreen = true;
        }
        break;
      case Direction.down:
        position = position.translate(0, speed * t);
        if (position.dy > game.screenSize.height + 50) {
          isOffscreen = true;
        }
        break;
      case Direction.left:
        position = position.translate(-speed * t, 0);
        if (position.dx < -50) {
          isOffscreen = true;
        }
        break;
    }
  }
}
