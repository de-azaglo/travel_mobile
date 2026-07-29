import 'package:flutter/material.dart';
import '../models/booking_data.dart';

class BookingSummaryScreen extends StatelessWidget {
  final BookingData booking;

  const BookingSummaryScreen({
    super.key,
    required this.booking,
  });

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Row(
            children: [
              Icon(Icons.check_circle_rounded, color: Colors.green, size: 28),
              SizedBox(width: 10),
              Text('Booking Confirmed!'),
            ],
          ),
          content: Text(
            'Thank you ${booking.travelerName}! Your trip to ${booking.destination} on ${booking.formattedDate} has been reserved under ref #${booking.bookingReference}.',
            style: const TextStyle(fontSize: 14, height: 1.4),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0F52BA),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss dialog
                Navigator.of(context).pop(); // Return to form screen
              },
              child: const Text('Back to Home'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        title: const Text(
          'Booking Summary',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF0F52BA),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Boarding Pass Ticket Card
            Card(
              elevation: 4,
              shadowColor: Colors.black.withValues(alpha: 0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  // Ticket Top Gradient Banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF0A2540), Color(0xFF0F52BA)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF10B981).withValues(alpha: 0.2),
                                border: Border.all(color: const Color(0xFF34D399)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Row(
                                children: [
                                  CircleAvatar(
                                    radius: 3,
                                    backgroundColor: Color(0xFF34D399),
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    'READY TO BOOK',
                                    style: TextStyle(
                                      color: Color(0xFF34D399),
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'REF: ${booking.bookingReference}',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.8),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ORIGIN',
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'Current Location',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.15),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.flight_takeoff_rounded,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'DESTINATION',
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  booking.destination,
                                  style: const TextStyle(
                                    color: Colors.amberAccent,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Dotted Divider Line
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: List.generate(
                        30,
                        (index) => Expanded(
                          child: Container(
                            height: 2,
                            color: index % 2 == 0
                                ? Colors.grey.shade300
                                : Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Ticket Main Information Body
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDetailRow(
                          context,
                          icon: Icons.person_rounded,
                          label: 'Traveler Name',
                          value: booking.travelerName,
                        ),
                        const Divider(height: 28, thickness: 0.8),
                        _buildDetailRow(
                          context,
                          icon: Icons.location_on_rounded,
                          label: 'Destination',
                          value: booking.destination,
                        ),
                        const Divider(height: 28, thickness: 0.8),
                        _buildDetailRow(
                          context,
                          icon: Icons.calendar_month_rounded,
                          label: 'Travel Date',
                          value: booking.formattedDate,
                        ),
                        const Divider(height: 28, thickness: 0.8),
                        _buildDetailRow(
                          context,
                          icon: Icons.confirmation_number_rounded,
                          label: 'Booking Reference',
                          value: booking.bookingReference,
                        ),

                        const SizedBox(height: 24),

                        // Visual Mock Barcode Section
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8FAFC),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: const Color(0xFFE2E8F0)),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: List.generate(
                                  28,
                                  (index) => Container(
                                    width: (index % 3 == 0) ? 4 : 2,
                                    height: 40,
                                    color: (index % 5 == 0)
                                        ? Colors.grey.shade400
                                        : const Color(0xFF1E293B),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                '* ${booking.bookingReference} *',
                                style: const TextStyle(
                                  fontFamily: 'monospace',
                                  fontSize: 12,
                                  letterSpacing: 2,
                                  color: Color(0xFF64748B),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Confirm & Back Action Buttons
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton.icon(
                onPressed: () => _showConfirmationDialog(context),
                icon: const Icon(Icons.check_circle_outline_rounded),
                label: const Text(
                  'Confirm & Complete Booking',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F52BA),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 2,
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.edit_note_rounded),
                label: const Text(
                  'Modify Details',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF475569),
                  side: const BorderSide(color: Color(0xFFCBD5E1)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF0F52BA).withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: const Color(0xFF0F52BA), size: 20),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label.toUpperCase(),
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF64748B),
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
