import 'package:flutter/material.dart';
import 'package:salon_appointment_booking_app/core/theme/theme.dart';
import 'package:salon_appointment_booking_app/features/shared/auth/presentation/pages/sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Appointment Booking App',
      theme: AppTheme.lightThemeMode,
      home: const SignInPage(),
    );
  }
}