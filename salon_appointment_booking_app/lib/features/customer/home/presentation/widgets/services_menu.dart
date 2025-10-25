import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salon_appointment_booking_app/features/customer/home/data/dataSources/local%20data/services_data.dart';
import 'package:salon_appointment_booking_app/features/customer/home/presentation/widgets/services_scroll_menu_item.dart';

class ServicesMenu extends StatelessWidget {
  const ServicesMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Services',
              style: GoogleFonts.italiana(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111111)
              ),
            ),
            Spacer(),
            Text(
              'View All',
              style: GoogleFonts.quicksand(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600]
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: ServicesData.services.map((service) {
              return Row(
                children: [
                  ServicesScrollMenuItem(
                    title: service['title'],
                    image: service['image'],
                  ),
                  const SizedBox(width: 10),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
