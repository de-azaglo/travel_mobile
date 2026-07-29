import 'package:flutter/material.dart';
import 'screens/booking_form_screen.dart';

void main() {
  runApp(const TravelBookingApp());
}

class TravelBookingApp extends StatelessWidget {
  const TravelBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Booking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F52BA),
          primary: const Color(0xFF0F52BA),
          secondary: const Color(0xFF2563EB),
          surface: const Color(0xFFF8FAFC),
        ),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: const BookingFormScreen(),
    );
  }
}
