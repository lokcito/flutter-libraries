import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:pantallas/game/box_component.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: SimpleGame(onExit: () {
      context.go("/");
    }));
  }
}
class SimpleGame extends FlameGame with TapCallbacks {
  final VoidCallback onExit;

  SimpleGame({required this.onExit});

  @override
  Future<void> onLoad() async {
    final btnExit = RectangleComponent(
      size: Vector2(150, 50),
      paint: Paint()..color = CupertinoColors.systemRed,
    );

    btnExit.add(TextComponent(
      text: 'Volver',
      position: btnExit.size / 2,
      anchor: Anchor.center
    ));

    add(ButtonComponent(
      button: btnExit,
      onPressed: onExit
    ));

    add(BoxComponent(screenSize: size));
  }
}