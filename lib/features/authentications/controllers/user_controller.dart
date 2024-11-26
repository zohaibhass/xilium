import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xilium/features/authentications/models/user_model.dart';


class UserController {
  Future<Map<String, dynamic>> registerUser(UserModel user) async {
  String url = "https://xilium.no/wp-json/mobile-apis/register";
    final Uri parseUrl = Uri.parse(url);

    try {
      final response = await http.post(
        parseUrl,
        body: json.encode(user.toJson()),
        headers: {"content-type": "application/json"},
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to register user');
      }
    } catch (e) {
      return {"error": e.toString()};
    }
  }
}
