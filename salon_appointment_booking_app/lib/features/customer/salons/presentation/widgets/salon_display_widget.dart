import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salon_appointment_booking_app/core/theme/palette.dart';
import 'package:salon_appointment_booking_app/features/customer/salons/presentation/pages/salon_details.dart';

class SalonDisplayWidget extends StatelessWidget {
  final String image;
  final String name;
  final double rating;
  final double distance;
  final String email;
  final String contact;
  final String address;

  const SalonDisplayWidget({
    required this.image,
    required this.address,
    required this.contact,
    required this.email,
    required this.distance,
    required this.name,
    required this.rating,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey[100],
      ),
      
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Palette.whiteColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 200,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          const SizedBox(height: 10),
                          Text(
                            name,
                            style: GoogleFonts.italiana(
                              color: Palette.blackColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          
                          const SizedBox(height: 2),
                          Text(
                            address,
                            style: GoogleFonts.quicksand(
                              color: Colors.grey[600],
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            distance.toString() + ' km away',
                            style: GoogleFonts.quicksand(
                              color: Palette.blackColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SalonDetails(
                                            image: image,
                                            address: address,
                                            contact: contact,
                                            email: email,
                                            distance: distance,
                                            name: name,
                                            rating: rating,
                                          )));
                            },
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('View Details',
                                    style: GoogleFonts.poppins(
                                      color: Palette.mainColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    )),
                                const SizedBox(width: 5),
                                Icon(
                                  Iconsax.arrow_right,
                                  size: 12,
                                  color: Palette.mainColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
