import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spring_service/constants/const.dart';
import 'package:spring_service/data/models/staff_model.dart';

class FetchTopStaffData {
  Future<List<StaffModel>> fetchTopStaff() async {
    try {
      final request = await http.get(Uri.parse('$baseUrl/top-staff'));
      if (request.statusCode == 200) {
        List<dynamic> response = json.decode(request.body);
        List<StaffModel> topStaff = response.map((staff) {
          return StaffModel(
            id: staff['id'],
            circleAvatarUrl: '',
            name: staff['name'],
            service: staff['service'],
            rating: staff['rating'],
            charge: staff['charge'],
          );
        }).toList();
        return topStaff;
      } else {
        throw Exception('');
      }
    } catch (e) {
      throw Exception('');
    }
  }
}
