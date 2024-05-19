import 'dart:convert';

import 'package:http/http.dart' as http;

class PostResult {
  String id;
  String name;
  String job;
  String created;

  PostResult({required this.id, required this.name, required this.job, required this.created});

  factory PostResult.createPostResult(Map<String, dynamic> object) {
    print(
      '1 $object',
    );
    return PostResult(id: object['id'], name: object['name'], job: object['job'], created: object['createdAt']);
  }

  static Future<PostResult> connectToApi(String name, String job) async {
    Uri apiUrl = Uri.https("reqres.in", "/api/users");
    var apiResult = await http.post(apiUrl, body: {"name": name, "job": job});
    var jsonObject = json.decode(apiResult.body);
    print(
      'jsonObject $jsonObject',
    );
    return PostResult.createPostResult(jsonObject);
  }
}
