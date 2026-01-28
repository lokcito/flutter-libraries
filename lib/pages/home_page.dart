import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pantallas/models/digi_model.dart';
import 'package:pantallas/services/digi_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final DigiService _digiService = DigiService();
  late Future<List<DigiModel>> _digiList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _digiList = _digiService.getDigimons();
  }

  void _incrementCounter(BuildContext context) {
    setState(() {
      _counter++;
    });
    context.go("/about");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo Click Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text('$_counter', style: const TextStyle(fontSize: 25)),
            ElevatedButton(
              onPressed: () => {context.go("/formulario")},
              child: Text("Ir al formulario"),
            ),
            Expanded(
              child: FutureBuilder<List<DigiModel>>(
                future: _digiList,
                builder: (context, snapshot) {
                  final digimons = snapshot.data!;
                  return ListView.builder(
                    itemCount: digimons.length,
                    itemBuilder: (_, indice) {
                      return ListTile(
                        leading: Image.network(digimons[indice].image),
                        title: Text(digimons[indice].name),
                        subtitle: Text("yyyy"),
                        onTap: () {
                          print("Seleccionado: ${digimons[indice].name}");
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _incrementCounter(context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
