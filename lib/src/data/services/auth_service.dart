import 'package:dio/dio.dart';
import 'package:tasks_app/src/config/config.dart';
import 'package:tasks_app/src/data/models/login_response.dart';

class AuthService {
  final _dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<String?> login(String username, String password) async {
    try {
      var response = await _dio.post(
        '/auth/login',
        data: {"usuario": username, "clave": password},
      );
      LoginResponse loginResponse = LoginResponse.fromJson(response.data);
      return loginResponse.token;
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
            "Error en la conexión con el servidor: ${e.response!.data["data"]}");
      } else {
        throw Exception("Error de conexión: ${e.message}");
      }
    } catch (e) {
      throw Exception("Error de inicio de sesión: $e");
    }
  }
}
