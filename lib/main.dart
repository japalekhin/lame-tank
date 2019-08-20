import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lame_tank/lame-tank.dart';

void main() async {
  // set preferred orientations (landscape only)
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  // disable all UI overlays (show fullscreen)
  await SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(LameTank().widget);
}
