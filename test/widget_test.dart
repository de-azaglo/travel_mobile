import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:travel/main.dart';

void main() {
  testWidgets('Travel Booking App form rendering and validation test',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    // Build app
    await tester.pumpWidget(const TravelBookingApp());

    // Verify form title and elements are present.
    expect(find.text('Travel Agency'), findsOneWidget);
    expect(find.text('Traveler Name'), findsOneWidget);
    expect(find.text('Destination'), findsOneWidget);
    expect(find.text('Preferred Travel Date'), findsOneWidget);

    final continueBtn = find.text('Continue to Summary');
    expect(continueBtn, findsOneWidget);
    await tester.ensureVisible(continueBtn);
    await tester.pumpAndSettle();

    // Tap Continue without filling form to trigger validation
    await tester.tap(continueBtn);
    await tester.pumpAndSettle();

    // Verify validation errors appear
    expect(find.text('Please enter traveler name'), findsOneWidget);
    expect(find.text('Please enter a destination'), findsOneWidget);
  });

  testWidgets('Full travel booking flow: fill form and navigate to summary',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const TravelBookingApp());

    // Enter traveler name
    final nameField = find.widgetWithText(TextFormField, 'e.g. Jane Doe');
    expect(nameField, findsOneWidget);
    await tester.ensureVisible(nameField);
    await tester.enterText(nameField, 'Alex Smith');

    // Enter destination
    final destinationField =
        find.widgetWithText(TextFormField, 'e.g. Paris, France');
    expect(destinationField, findsOneWidget);
    await tester.ensureVisible(destinationField);
    await tester.enterText(destinationField, 'Tokyo, Japan');

    // Tap date picker field
    final dateSelector = find.text('Select departure date');
    expect(dateSelector, findsOneWidget);
    await tester.ensureVisible(dateSelector);
    await tester.pumpAndSettle();
    await tester.tap(dateSelector);
    await tester.pumpAndSettle();

    // Select 'OK' in DatePicker dialog
    final okButton = find.text('OK');
    expect(okButton, findsOneWidget);
    await tester.tap(okButton);
    await tester.pumpAndSettle();

    // Tap Continue button
    final continueBtn = find.text('Continue to Summary');
    await tester.ensureVisible(continueBtn);
    await tester.tap(continueBtn);
    await tester.pumpAndSettle();

    // Verify Booking Summary Screen elements
    expect(find.text('Booking Summary'), findsOneWidget);
    expect(find.text('Alex Smith'), findsOneWidget);
    expect(find.text('Tokyo, Japan'), findsNWidgets(2)); // Ticket header + body
    expect(find.text('Confirm & Complete Booking'), findsOneWidget);

    // Tap Confirm button and check dialog
    final confirmBtn = find.text('Confirm & Complete Booking');
    await tester.ensureVisible(confirmBtn);
    await tester.tap(confirmBtn);
    await tester.pumpAndSettle();

    expect(find.text('Booking Confirmed!'), findsOneWidget);
    expect(find.text('Back to Home'), findsOneWidget);

    // Return home
    await tester.tap(find.text('Back to Home'));
    await tester.pumpAndSettle();

    // Back at form screen
    expect(find.text('Travel Agency'), findsOneWidget);
  });
}
