import 'package:flutter/foundation.dart';

@immutable
class BookingData {
  final String travelerName;
  final String destination;
  final DateTime travelDate;
  final String bookingReference;

  const BookingData({
    required this.travelerName,
    required this.destination,
    required this.travelDate,
    required this.bookingReference,
  });

  String get formattedDate {
    final year = travelDate.year;
    final month = _monthName(travelDate.month);
    final day = travelDate.day.toString().padLeft(2, '0');
    return '$month $day, $year';
  }

  static String _monthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    if (month >= 1 && month <= 12) {
      return months[month - 1];
    }
    return '';
  }
}
