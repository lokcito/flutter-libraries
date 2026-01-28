

import 'package:dio/dio.dart';
import 'package:pantallas/models/digi_model.dart';
import 'package:pantallas/utils/dio_client.dart';

class PersonService {
  final Dio _dio = WebhookSiteClient.dio;

  Future<dynamic> save(String nombre, String email) async {
    try {
      final response = await _dio.post("", data: {
        "nombre": nombre,
        "email": email});
      // Extraido la data de json
      return response.data;
    } catch (e) {
      throw Exception("Error cargando guardando data.");
    }
  }
}
