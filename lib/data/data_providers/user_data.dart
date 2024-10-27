import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spring_service/constants/const.dart';
import 'package:spring_service/data/models/app_user_model.dart';

class UserData {
  Future<AppUserModel?> fetchUser(String userId) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/user/id=$userId'));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final user = jsonResponse.map((user) {
          return AppUserModel(
            userId: user['userId'],
            firstName: user['firstName'],
            lastName: user['lastName'],
            email: user['email'],
            password: user['password'],
            balance: user['balance'],
            profilePicture: user[''],
            profilePictureUrl: user[''],
            address: user[''],
            isVerified: user[''],
            givenReviews: [],
            receivedReviews: [],
            payments: [],
            isSubscribedToNewsletter: user[''],
            recieveNotifications: user[''],
            isDeleted: user[''],
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
