import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salon_appointment_booking_app/core/theme/palette.dart';

class HomeSalonDisplayContainer extends StatelessWidget {
  final String image;
  final String name;
  final String address;
  final double rating;
  final double distance;

  const HomeSalonDisplayContainer({
    required this.image,
    required this.name,
    required this.address,
    required this.rating,
    required this.distance,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[100],
      ),

      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(20),
            ),
            height: 120,
            width: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: GoogleFonts.italiana(
                    color: Palette.blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),

                ),
                const SizedBox(height: 5),
                Text(
                  address,
                  style: GoogleFonts.quicksand(
                    color: Colors.grey[600],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Palette.blackColor,
                      size: 12,
                    ),
                    Text(
                      distance.toString() + ' Km',
                      style: GoogleFonts.quicksand(
                        color: Palette.blackColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}