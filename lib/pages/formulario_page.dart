import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pantallas/services/person_service.dart';

class FormularioPage extends StatefulWidget {
  const FormularioPage({super.key});
  @override
  _FormularioPageState createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  final _formKey = GlobalKey<FormState>();
  String fieldNombre = "";
  String fieldEmail = "";
  PersonService personService = PersonService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Formulario de Registro"),
          Padding(
            padding: EdgeInsets.only(left: 32, right: 32),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    onSaved: (newValue) => fieldNombre = newValue!,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: "Nombre",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa tu nombre';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    onSaved: (newValue) => fieldEmail = newValue!,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa tu email';
                      }
                      if (value.contains('@') == false) {
                        return 'Por favor ingresa un email válido';
                      }
                      if (value.split("@")[1].contains(".") == false) {
                        return 'Por favor ingresa un email válido';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        print("Nombre: $fieldNombre");
                        print("Email: $fieldEmail");
                        mostrarCargando();
                        await personService.save(fieldNombre, fieldEmail);
                        ocultarCargando();
                      } else {
                        print("Formulario inválido");
                      }
                    },
                    child: Text("Enviar"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  void mostrarCargando() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 16),
              Text("Cargando..."),
            ],
          ),
        );
      },
    );
  }
  void ocultarCargando() {
    Navigator.of(context).pop();
  }
}
