import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tasks_app/src/data/models/task_model.dart';
import 'dart:convert';

class TaskService extends GetxService {
  final String baseUrl = 'http://localhost:3006';

  Future<List<Task>> getTasks() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/api/tareas"));
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        return jsonData.map((task) => Task.fromJson(task)).toList();
      } else {
        throw Exception('Error al obtener las tareas');
      }
    } catch (e) {
      throw Exception('Error en la conexión');
    }
  }

  Future<Task?> getTaskById(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$id'));
      if (response.statusCode == 200) {
        return Task.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Error en la conexión');
    }
  }

  Future<bool> createTask(Task task) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/api/tareas"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(task.toJson()),
      );
      return response.statusCode == 201;
    } catch (e) {
      throw Exception('Error al crear la tarea');
    }
  }

  Future<bool> updateTask(int id, Task task) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/api/tareas/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(task.toJson()),
      );
      return response.statusCode == 200;
    } catch (e) {
      throw Exception('Error al actualizar la tarea');
    }
  }

  Future<bool> deleteTask(int id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/api/tareas/$id'));
      return response.statusCode == 200;
    } catch (e) {
      throw Exception('Error al eliminar la tarea');
    }
  }
}
