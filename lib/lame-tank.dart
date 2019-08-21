import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:lame_tank/components/bullet.dart';
import 'package:lame_tank/components/tank.dart';

class LameTank extends Game {
  Size screenSize;
  Tank tank;
  List<Bullet> bullets;

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
      shoot();
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

  void onUpDragStart(DragDownDetails d) {}

  void onUpDragEnd(DragEndDetails d) {}

  void onRightDragStart(DragDownDetails d) {}

  void onRightDragEnd(DragEndDetails d) {}

  void onDownDragStart(DragDownDetails d) {}

  void onDownDragEnd(DragEndDetails d) {}

  void onLeftDragStart(DragDownDetails d) {}

  void onLeftDragEnd(DragEndDetails d) {}

  void onFireTap() {}
}
