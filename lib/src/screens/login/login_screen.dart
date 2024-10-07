import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks_app/src/screens/login/login_controller.dart';

class LoginPage extends GetView<AuthController> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isVisible = false.obs;
  LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.1),
              Image.asset(
                  width: width * 0.6, height: height * 0.2, 'assets/task.png'),
              SizedBox(height: height * 0.05),
              const Text("Control de Tareas"),
              SizedBox(height: height * 0.02),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Debe ingresar el usuario';
                  }
                  return null;
                },
                controller: userNameController,
                decoration: InputDecoration(
                  labelText: 'Usuario',
                  prefixIcon: const Icon(Icons.person_2_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.green, width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Obx(() => TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Debe Ingresar la Contraseña';
                      }
                      return null;
                    },
                    controller: passwordController,
                    obscureText: isVisible.value ? false : true,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(isVisible.value
                            ? Icons.visibility_off
                            : Icons.remove_red_eye_outlined),
                        onPressed: () {
                          isVisible.value = !isVisible.value;
                        },
                      ),
                      prefixIcon: const Icon(Icons.lock_person_outlined),
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.green, width: 2.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  )),
              const SizedBox(height: 24.0),
              SizedBox(
                height: height * 0.07,
                width: double.infinity,
                child: Obx(() => ElevatedButton(
                      onPressed: controller.isLogin.value ? null : _validate,
                      child: controller.isLogin.value
                          ? const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: CircularProgressIndicator())
                          : const Text('Ingresar'),
                    )),
              ),
              SizedBox(height: height * 0.05),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Desarrollado por Prefectura de Manabí",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "All rights Reserved ${DateTime.now().year}",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _validate() async {
    controller.isLogin.value = true;
    controller.userName.value = userNameController.text.trim();
    controller.password.value = passwordController.text.trim();
    final isLogin = await controller.login();
    if (isLogin) {
      Get.offAllNamed('/task');
      Get.snackbar(
        'Completado',
        'Login Correcto: Bienvenido',
        backgroundColor: Colors.green[100],
      );
    } else {
      Get.snackbar('Error', 'Ingreso incorrecto: ${controller.error.value}',
          backgroundColor: Colors.red[200]);
      // Get.snackbar('Error', 'Ingreso Incorrecto:',
      //     backgroundColor: Colors.red[200]);
      // controller.isLogin.value = false;
    }
    return true;
  }
}
