import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/painting.dart';

class BoxComponent extends RectangleComponent with TapCallbacks {
  final Vector2 screenSize;
  double speed = 100;
  final Random _random = Random();

  BoxComponent({required this.screenSize})
    : super(
        size: Vector2(60, 60),
        paint: Paint()..color = const Color(0xFF00FF00),
      ) {
    position = Vector2(124, 400);
  }

  void update(double dt) {
    super.update(dt);

    position.x += dt * speed;
    position.y += dt * speed;

    if (position.y > screenSize.y) {
      animacion();
    }
    if (position.x > screenSize.x) {
      animacion();
    }
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    animacion();
  }

  void animacion() {
    position.y = height * -1 * 2;
    position.x = _random.nextDouble() * (screenSize.x - width);
  }
}
