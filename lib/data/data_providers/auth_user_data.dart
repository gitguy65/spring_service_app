import 'dart:convert';

import 'package:spring_service/constants/const.dart';
import 'package:http/http.dart' as http;
import 'package:spring_service/data/models/app_user_model.dart';
import 'package:spring_service/data/models/auth_response_model.dart';

class AuthUserData {
  Future<bool> register(AppUserModel user) async {
    try {
      final request = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
          {
            'firstName': user.firstName,
            'lastName': user.lastName,
            'email': user.email,
            'password': user.password,
          },
        ),
      );
      if (request.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('Error : $e');
    }
  }

  Future<AuthResponseModel> login(String email, String password) async {
    try {
      final request = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'applicaiton/json'},
        body: jsonEncode(
          {
            email: email,
            password: password,
          },
        ),
      );

      if (request.statusCode == 200) {
        final response = json.decode(request.body);
        return AuthResponseModel(
          userId: response['userId'],
          token: response['token'],
        );
      } else {
        print('Login failed: ${request.body}');
        return AuthResponseModel(
          userId: '',
          token: '',
        );
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
