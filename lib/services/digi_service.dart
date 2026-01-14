import 'package:dio/dio.dart';
import 'package:pantallas/models/digi_model.dart';
import 'package:pantallas/utils/dio_client.dart';

class DigiService {
  final Dio _dio = DioClient.dio;

  Future<List<DigiModel>> getDigimons() async {
    try {
      final response = await _dio.get("/digimon");
      // Extraido la data de json
      final List listado = response.data["content"];
      // Convierto el json en modelos para Flutter
      return listado.map((e) => DigiModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Error cargando la data.");
    }
  }
}
