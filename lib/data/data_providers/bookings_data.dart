import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spring_service/constants/const.dart';
import 'package:spring_service/data/models/booking_model.dart';

class BookingsData {
  String token;

  BookingsData(this.token);

  Future<List<BookingModel>> fetchBookings(
      String userId, int page, int take) async {
    if (token.isEmpty) {
      throw Exception('User is not registerd or logged in');
    }

    try {
      final response = await http.get(
        Uri.parse(
            '$baseUrl/bookings/get?user_id=$userId&page=$page&take=$take'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonBookings = json.decode(response.body);
        List<BookingModel> bookings = jsonBookings.map((booking) {
          return BookingModel(
            categoryAvatarUrl: booking['categoryAvatarUrl'],
            description: booking['description'],
            staffName: booking['staffName'],
            startDate: DateTime.parse(booking['startDate']),
            endDate: DateTime.parse(booking['endDate']),
            bookedDate: DateTime.parse(booking['bookedDate']),
            status: booking['status'],
            userId: booking['userId'],
            isAccepted: booking['isAccepted'],
            isPaymentConfirmed: booking['isPaymentConfirmed'],
            charge: booking['charge'],
          );
        }).toList();

        return bookings;
      } else {
        throw Exception('Failed to load bookings');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<bool> createBooking(BookingModel booking) async {
    if (token.isEmpty) {
      throw Exception('User is not registerd or logged in');
    }
    try {
      var bookingData = {
        'categoryAvatarUrl': booking.categoryAvatarUrl,
        'description': booking.description,
        'staffName': booking.staffName,
        'startDate': booking.startDate.toIso8601String(),
        'endDate': booking.endDate.toIso8601String(),
        'bookedDate': booking.bookedDate.toIso8601String(),
        'status': booking.status,
      };

      final response = await http.post(
        Uri.parse('$baseUrl/bookings/create'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: json.encode(bookingData),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future<bool> updateBooking(BookingModel booking, String bookingId) async {
    if (token.isEmpty) {
      throw Exception('User is not registerd or logged in');
    }
    try {
      var bookingData = {
        'categoryAvatarUrl': booking.categoryAvatarUrl,
        'description': booking.description,
        'staffName': booking.staffName,
        'startDate': booking.startDate.toIso8601String(),
        'endDate': booking.endDate.toIso8601String(),
        'bookedDate': booking.bookedDate.toIso8601String(),
        'status': booking.status,
      };

      final response = await http.post(
        Uri.parse('$baseUrl/bookings/update?bookingId=$bookingId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: json.encode(bookingData),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future<bool> deleteBooking(String bookingId) async {
    if (token.isEmpty) {
      throw Exception('User is not registerd or logged in');
    }
    final response = await http.delete(
      Uri.parse('$baseUrl/bookings/delete?bookingId=$bookingId'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
