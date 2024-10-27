import 'package:spring_service/data/models/payment_model.dart';
import 'package:spring_service/data/models/review_model.dart';

class AppUserModel {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String balance;
  final String profilePicture;
  final String profilePictureUrl;
  final String address;
  final String isVerified;
  final List<ReviewModel>? givenReviews;
  final List<ReviewModel>? receivedReviews;
  final List<PaymentModel>? payments;
  final bool isSubscribedToNewsletter;
  final bool recieveNotifications;
  final bool isDeleted;

  AppUserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.balance,
    required this.profilePicture,
    required this.profilePictureUrl,
    required this.address,
    required this.isVerified,
    required this.givenReviews,
    required this.receivedReviews,
    required this.payments,
    required this.isSubscribedToNewsletter,
    required this.recieveNotifications,
    required this.isDeleted,
  });
}
