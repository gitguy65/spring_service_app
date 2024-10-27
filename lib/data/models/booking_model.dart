class BookingModel {
  String userId;
  String categoryAvatarUrl;
  String description;
  String staffName;
  double charge;
  bool isAccepted;
  bool isPaymentConfirmed;
  DateTime startDate;
  DateTime endDate;
  DateTime bookedDate;
  String status;

  BookingModel(
      {required this.userId,
      required this.categoryAvatarUrl,
      required this.description,
      required this.staffName,
      required this.charge,
      required this.isAccepted,
      required this.isPaymentConfirmed,
      required this.startDate,
      required this.endDate,
      required this.bookedDate,
      required this.status});
}
