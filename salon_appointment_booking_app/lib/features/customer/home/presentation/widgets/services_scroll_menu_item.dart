import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salon_appointment_booking_app/core/theme/palette.dart';

class ServicesScrollMenuItem extends StatelessWidget {
  final String title;
  final String image;

  const ServicesScrollMenuItem({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Palette.mainColor,
          backgroundImage: AssetImage(image),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: GoogleFonts.quicksand(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600]
          ),
        ),
      ],
    );
  }
}
