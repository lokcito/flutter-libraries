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
  List<DigiModel> digimonsCargados = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _digiList = _cargaInicial();
  }

  Future<List<DigiModel>> _cargaInicial() async {
    final lista = await _digiService.getDigimons();
    digimonsCargados = lista;
    return lista;
  }

  _cargarMasDigimons() async {
    print("Cargando más digimons...");
    final lista = await _digiService.getDigimons();
    setState(() {
       digimonsCargados.addAll(lista);
    });
   
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
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final digimons = snapshot.data!;
                  return ListView.builder(
                    itemCount: digimonsCargados.length + 1,
                    itemBuilder: (_, indice) {
                      if (indice == digimonsCargados.length) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      if (indice == digimonsCargados.length - 1) {
                        _cargarMasDigimons();
                      }
                      return ListTile(
                        leading: Image.network(digimonsCargados[indice].image),
                        title: Text(digimonsCargados[indice].name),
                        subtitle: Text("yyyy"),
                        onTap: () {
                          print(
                            "Seleccionado: ${digimonsCargados[indice].name}",
                          );
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
