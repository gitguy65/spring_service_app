class BookingModel {
  String userId;
  String categoryAvatarUrl;
  String description;
  String staffName;
  DateTime startDate;
  DateTime endDate;
  DateTime bookedDate;
  String status;

  BookingModel(
      {required this.userId,
      required this.categoryAvatarUrl,
      required this.description,
      required this.staffName,
      required this.startDate,
      required this.endDate,
      required this.bookedDate,
      required this.status});
}
