import 'dart:convert';

import '/models/users.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<List<User>> getData() async {
    final uri = Uri.https('614eefe4b4f6d30017b483e4.mockapi.io', '/api/users/');

    final response = await http.get(uri);

    List<User> users = (jsonDecode(response.body) as List)
        .map((json) => User.formJson(json))
        .toList();

    return users;
  }

  Future<User> selectData(id) async {
    final uri =
        Uri.https('614eefe4b4f6d30017b483e4.mockapi.io', '/api/users/$id');

    final response = await http.get(uri);

    return User.formJson(jsonDecode(response.body));
  }

  Future createData(data) async {
    final uri = Uri.https('614eefe4b4f6d30017b483e4.mockapi.io', '/api/users/');
    var body = json.encode(data);
    await http.post(uri,
        headers: {"Content-Type": "application/json"}, body: body);
  }
}
