import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [Text("Acerca de la empresa: "),
      ElevatedButton(onPressed: () {
        context.go("/");
      }, child: Text("Regresar a inicio"))
      ]),
    );
  }
}
