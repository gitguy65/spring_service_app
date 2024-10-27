import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spring_service/constants/const.dart';
import 'package:spring_service/data/models/app_user.dart';

class UserData {
  Future<AppUser?> fetchUser(String userId) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/user/id=$userId'));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final user = jsonResponse.map((u) {
          return AppUser(
            userId: u['userId'],
            firstName: u['firstName'],
            lastName: u['lastName'],
            password: u['password'],
            balance: u['balance'],
          );
        });

        return user;
      } else {
        throw Exception('failed to retrieve user');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
