import 'package:spring_service/constants/enums/payment_type.dart';

class PaymentModel {
  final int id;
  final String userId;
  final String serviceId;
  final double amount;
  final String currency;
  final double charge;
  final double commission;
  final String details;
  final PaymentType paymentType;

  PaymentModel({
    required this.id,
    required this.userId,
    required this.serviceId,
    required this.amount,
    required this.currency,
    required this.charge,
    required this.commission,
    required this.details,
    required this.paymentType,
  });
}
