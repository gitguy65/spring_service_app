import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spring_service/constants/const.dart';
import 'package:spring_service/data/models/review_model.dart';

class ReviewData {
  Future<List<ReviewModel>> getRecentReviews(String userId) async {
    try {
      final request = await http.get(
        Uri.parse('$baseUrl/reviews/$userId/recent-reviews'),
      );

      if (request.statusCode == 200) {
        List<dynamic> response = json.decode(request.body);
        List<ReviewModel> userReviews = response.map((review) {
          return ReviewModel(
            message: review['message'],
            stars: review['stars'],
          );
        }).toList();

        return userReviews;
      } else {
        List<ReviewModel> userReviews = [];
        return userReviews;
      }
    } catch (e) {
      throw Exception('Couldn\'t fetch recent reivews');
    }
  }

  Future<List<ReviewModel>> getTopReviews(String userId) async {
    try {
      final request = await http.get(
        Uri.parse('$baseUrl/reviews/$userId/top-reviews'),
      );

      if (request.statusCode == 200) {
        List<dynamic> response = json.decode(request.body);
        List<ReviewModel> userReviews = response.map((review) {
          return ReviewModel(
            message: review['message'],
            stars: review['stars'],
          );
        }).toList();

        return userReviews;
      } else {
        List<ReviewModel> userReviews = [];
        return userReviews;
      }
    } catch (e) {
      throw Exception('Couldn\'t fetch top reivews');
    }
  }

  Future<List<ReviewModel>> getLowestReviews(String userId) async {
    try {
      final request = await http.get(
        Uri.parse('$baseUrl/reviews/$userId/lowest-reviews'),
      );

      if (request.statusCode == 200) {
        List<dynamic> response = json.decode(request.body);
        List<ReviewModel> userReviews = response.map((review) {
          return ReviewModel(
            message: review['message'],
            stars: review['stars'],
          );
        }).toList();

        return userReviews;
      } else {
        List<ReviewModel> userReviews = [];
        return userReviews;
      }
    } catch (e) {
      throw Exception('Couldn\'t fetch lowest reivews');
    }
  }
}
