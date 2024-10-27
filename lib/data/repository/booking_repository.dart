import 'package:spring_service/data/data_providers/bookings_data.dart';
import 'package:spring_service/data/models/booking_model.dart';

class BookingRepository {
  final BookingsData bookingsData;

  BookingRepository(this.bookingsData);

  Future<List<BookingModel>> getUserBookings(
      String userId, int page, int take) async {
    return await bookingsData.fetchBookings(userId, page, take);
  }

  Future<bool> createBooking(BookingModel booking) async {
    return await bookingsData.createBooking(booking);
  }

  Future<bool> updateBooking(BookingModel booking, String bookingId) async {
    return await bookingsData.updateBooking(booking, bookingId);
  }

  Future<bool> deleteBooking(String bookingId) async {
    return await bookingsData.deleteBooking(bookingId);
  }
}
