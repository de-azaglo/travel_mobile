# Travel Agency App

A Flutter travel booking application built with Material 3.

## Architecture Decisions

### 1. State Management
- **Local Component State**: Managed via `StatefulWidget` and `setState` for transient form inputs, validation state, and date selection in `BookingFormScreen`.
- **Immutable Data Transfer**: Data flows immutably via `BookingData` model instances passed through screen constructors.

### 2. Routing & Navigation
- **Navigator 1.0 (Imperative Routing)**: Uses `Navigator.push` with `MaterialPageRoute` for screen transitions between `BookingFormScreen` and `BookingSummaryScreen`.
- **Dialog & Stack Pops**: Modals handle contextual completion using `Navigator.pop`.

### 3. File & Directory Structure
```
lib/
├── main.dart                   # Entry point & app Theme configuration
├── models/
│   └── booking_data.dart       # Immutable domain data model
└── screens/
    ├── booking_form_screen.dart    # Form input screen
    └── booking_summary_screen.dart # Ticket summary screen
```

### 4. Layout & Responsiveness
- **Mobile-First Layout**: Fully responsive layout optimized down to 375px screen widths.
- **Overflow Prevention**: Leverages `Expanded`, `Flexible`, and `FittedBox` wrappers around flex rows to eliminate `RenderFlex` overflow errors on smaller viewports.

## Running the App

```bash
flutter run
```

## Running Tests

```bash
flutter test
```
