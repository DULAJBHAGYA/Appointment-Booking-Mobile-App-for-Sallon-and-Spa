import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salon_appointment_booking_app/features/customer/home/data/dataSources/local%20data/salon_data.dart';
import 'package:salon_appointment_booking_app/features/customer/home/presentation/widgets/home_salon_display_container.dart';
import 'package:salon_appointment_booking_app/features/customer/salons/presentation/pages/salons.dart';

class NearestSalons extends StatelessWidget {
  const NearestSalons({super.key});

  @override
  Widget build(BuildContext context) {
    List sortedSalons = List.from(SalonsData.salons)
      ..sort((a, b) => a['distance'].compareTo(b['distance']));

    return Column(
      children: [
        Row(
          children: [
            Text(
              'Nearest Salon',
              style: GoogleFonts.italiana(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Salons(),
                  ),
                );
              },
              child: Text(
                'View All',
                style: GoogleFonts.quicksand(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Column(
          children: sortedSalons.take(5).map((salon) {
            return HomeSalonDisplayContainer(
              image: salon['image'],
              name: salon['name'],
              address: salon['address'],
              rating: salon['rating'],
              distance: salon['distance'],
            );
          }).toList(),
        ),
      ],
    );
  }
}
