import 'dart:math';
import 'dart:ui';
import 'package:lame_tank/helpers/directions.dart';
import 'package:lame_tank/lame-tank.dart';

class Tank {
  final LameTank game;
  Offset position = Offset.zero;
  Direction direction = Direction.up;

  Tank(this.game, {this.position});

  void render(Canvas c) {
    // prepare some paint objects
    Paint lightPaint = Paint()..color = Color(0xffdddddd);
    Paint darkPaint = Paint()..color = Color(0xff777777);

    // set the canvas origin onto the tank position
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

    // draw tank body
    c.drawRect(
      Rect.fromLTWH(-15, -20, 30, 40),
      lightPaint,
    );

    // draw wheels
    c.drawRect(
      Rect.fromLTWH(-23, -24, 8, 48),
      darkPaint,
    );
    c.drawRect(
      Rect.fromLTWH(15, -24, 8, 48),
      darkPaint,
    );

    // draw turret
    c.drawRect(
      Rect.fromLTWH(-12, -15, 24, 25),
      darkPaint,
    );
    c.drawRect(
      Rect.fromLTWH(-3, -36, 6, 36),
      darkPaint,
    );
    c.drawRect(
      Rect.fromLTWH(-5, -42, 10, 6),
      darkPaint,
    );

    c.restore();
  }

  Offset getBulletOffset() {
    switch (direction) {
      case Direction.up:
        return position.translate(0, -52);
        break;
      case Direction.right:
        return position.translate(52, 0);
        break;
      case Direction.down:
        return position.translate(0, 52);
        break;
      case Direction.left:
        return position.translate(-52, 0);
        break;
    }
    return Offset.zero;
  }
}
