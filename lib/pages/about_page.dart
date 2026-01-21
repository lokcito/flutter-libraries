import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String info = "Esta es una aplicación de ejemplo.";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(info),
          ElevatedButton(
            onPressed: () {
              context.go("/");
            },
            child: Text("Regresar a inicio"),
          ),
          ElevatedButton(
            onPressed: () {
              context.go("/game");
            },
            child: Text("Ir a juego"),
          ),
        ],
      ),
    );
  }
}
