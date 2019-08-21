import 'package:flutter/material.dart';
import 'package:lame_tank/lame-tank.dart';

class GameController extends StatelessWidget {
  final LameTank game;

  const GameController({Key key, @required this.game}) : super(key: key);

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // big empty space
        Spacer(),

        // the bottom part
        Row(
          children: <Widget>[
            // spacer to the left of directional buttons
            SizedBox(width: 48),

            // the directional buttons
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(width: 50),

                    // up button
                    GestureDetector(
                      child: Container(
                        height: 48,
                        width: 48,
                        color: Color(0xffffffff),
                        child: Center(
                          child: Icon(Icons.keyboard_arrow_up, size: 32),
                        ),
                      ),
                      onPanDown: game.onUpDragStart,
                      onPanEnd: game.onUpDragEnd,
                    ),

                    SizedBox(width: 50),
                  ],
                ),
                Row(
                  children: <Widget>[
                    // left button
                    GestureDetector(
                      child: Container(
                        height: 48,
                        width: 48,
                        color: Color(0xffffffff),
                        child: Center(
                          child: Icon(Icons.keyboard_arrow_left, size: 32),
                        ),
                      ),
                      onPanDown: game.onLeftDragStart,
                      onPanEnd: game.onLeftDragEnd,
                    ),

                    SizedBox(width: 50),

                    // right button
                    GestureDetector(
                      child: Container(
                        height: 48,
                        width: 48,
                        color: Color(0xffffffff),
                        child: Center(
                          child: Icon(Icons.keyboard_arrow_right, size: 32),
                        ),
                      ),
                      onPanDown: game.onRightDragStart,
                      onPanEnd: game.onRightDragEnd,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(width: 50),

                    // down button
                    GestureDetector(
                      child: Container(
                        height: 48,
                        width: 48,
                        color: Color(0xffffffff),
                        child: Center(
                          child: Icon(Icons.keyboard_arrow_down, size: 32),
                        ),
                      ),
                      onPanDown: game.onDownDragStart,
                      onPanEnd: game.onDownDragEnd,
                    ),

                    SizedBox(width: 50),
                  ],
                ),
              ],
            ),

            // space between directional buttons and fire button
            Spacer(),

            // the fire button
            Center(
              child: GestureDetector(
                child: Container(
                  height: 64,
                  width: 64,
                  color: Color(0xffffffff),
                  child: Center(
                    child: Icon(Icons.new_releases, size: 48),
                  ),
                ),
                onTap: game.onFireTap,
              ),
            ),

            // right of the fire button
            SizedBox(width: 48),
          ],
        ),

        // bottom spacer
        SizedBox(height: 18),
      ],
    );
  }
}
