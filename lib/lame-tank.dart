import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:lame_tank/components/bullet.dart';
import 'package:lame_tank/components/tank.dart';
import 'package:lame_tank/helpers/directions.dart';

class LameTank extends Game {
  Size screenSize;
  Tank tank;
  List<Bullet> bullets;
  String lastMove = '';
  double yMovement = 0;
  double xMovement = 0;

  void render(Canvas c) {
    // just end execution if there's no screenSize
    if (screenSize == null) {
      return;
    }

    // draw a grass field
    c.drawRect(
      Rect.fromLTWH(
        0,
        0,
        screenSize.width,
        screenSize.height,
      ),
      Paint()..color = Color(0xff27ae60),
    );

    // draw the tank
    tank.render(c);

    // draw bullets
    bullets.forEach((Bullet b) {
      b.render(c);
    });
  }

  void update(double t) {
    if (screenSize == null) {
      return;
    }

    // make tank move
    if (lastMove == 'x') {
      if (xMovement < 0) {
        tank.direction = Direction.left;
        tank.position = tank.position.translate(-100 * t, 0);
      }
      if (xMovement > 0) {
        tank.direction = Direction.right;
        tank.position = tank.position.translate(100 * t, 0);
      }
    }
    if (lastMove == 'y') {
      if (yMovement < 0) {
        tank.direction = Direction.up;
        tank.position = tank.position.translate(0, -100 * t);
      }
      if (yMovement > 0) {
        tank.direction = Direction.down;
        tank.position = tank.position.translate(0, 100 * t);
      }
    }

    // make bullets fly
    bullets.forEach((Bullet b) {
      b.update(t);
    });

    // remove off-screen bullets
    bullets.removeWhere((Bullet b) {
      return b.isOffscreen;
    });
  }

  void resize(Size size) {
    screenSize = size;

    if (tank == null) {
      tank = Tank(
        this,
        position: Offset(
          screenSize.width / 2,
          screenSize.height / 2,
        ),
      );
    }

    if (bullets == null) {
      bullets = List<Bullet>();
    }
  }

  void shoot() {
    bullets.add(
      Bullet(
        this,
        position: tank.getBulletOffset(),
        direction: tank.direction,
      ),
    );
  }

  void onUpDragStart(DragDownDetails d) {
    yMovement += -1;
    lastMove = 'y';
  }

  void onUpDragEnd(DragEndDetails d) {
    yMovement += 1;
  }

  void onRightDragStart(DragDownDetails d) {
    xMovement += 1;
    lastMove = 'x';
  }

  void onRightDragEnd(DragEndDetails d) {
    xMovement += -1;
  }

  void onDownDragStart(DragDownDetails d) {
    yMovement += 1;
    lastMove = 'y';
  }

  void onDownDragEnd(DragEndDetails d) {
    yMovement += -1;
  }

  void onLeftDragStart(DragDownDetails d) {
    xMovement += -1;
    lastMove = 'x';
  }

  void onLeftDragEnd(DragEndDetails d) {
    xMovement += 1;
  }

  void onFireTap() {
    shoot();
  }
}
