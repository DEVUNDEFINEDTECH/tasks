import 'package:get/get.dart';
import 'package:tasks_app/src/data/models/login_response.dart';
import 'package:tasks_app/src/data/services/auth_service.dart';

class AuthController extends GetxController {
  final AuthService autenticationService = AuthService();

  final isLogin = false.obs;
  final userName = ''.obs;
  final password = ''.obs;
  final error = ''.obs;
  Future<bool> login() async {
    try {
      error.value = "";
      isLogin.value = true;

      print("loggeando al APi");
      final token =
          await autenticationService.login(userName.value, password.value);
      print("token que viene del api en el login $token");
      if (token != null) {
        print("Estamos dentro de la validacion del success");
        //GlobalState.to.saveToken(response.data!.auth.accessToken);
        // Map<String, dynamic> decodedToken =
        //     JwtDecoder.decode(response.data!.auth.accessToken);
        //Map<String, dynamic> jsonUser = decodedToken['sub'];
        //GlobalState.to.user = User.fromJson(jsonUser);
        return true;
      }
      isLogin.value = false;
      return false;
    } catch (e) {
      error.value = "Usuario y/o contraseña incorrecto";
      isLogin.value = false;
      return false;
    }
  }
}
