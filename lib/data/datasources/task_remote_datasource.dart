import 'package:flutter_tasklist_app/data/models/task_response_model.dart';
import 'package:http/http.dart' as http;

class TaskRemoteDatasource {
  Future<TasksResponseModel> getTasks() async {
    final response =
        //tutorial berhenti menit 31:00 karena api list belum tersedia di postman (sisa 20 mnt)
        await http.get(Uri.parse('https://tasklist-api.dicoding.dev/v1/tasks'));
    if (response.statusCode == 200) {
      return TasksResponseModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load tasks');
    }
  }
}
