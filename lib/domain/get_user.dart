import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  int id;
  String name;

  User({required this.id, required this.name});

  factory User.createUser(Map<String, dynamic> object) {
    print(
      '1 $object',
    );
    return User(id: object['id'], name: object['name']);
  }

  static Future<List<User>> getUsers(String? page) async {
    Uri apiUrl = Uri.https("reqres.in", "/api/users?page=$page");
    var apiResult = await http.get(apiUrl);
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> userData = (jsonObject as Map<String, dynamic>)['data'];

    List<User> users = [];

    for (var i = 0; i < userData.length; i++) {
      users.add(User.createUser(userData[i]));
    }
    return users;
  }
}
