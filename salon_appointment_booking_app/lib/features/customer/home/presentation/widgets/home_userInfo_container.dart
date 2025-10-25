import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salon_appointment_booking_app/core/theme/palette.dart';

class HomeUserInfoContainer extends StatelessWidget {
  const HomeUserInfoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.backgroundColor,
      ),
      height: 150,
      width: double.infinity,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(
            30.0,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Palette.whiteColor,
                    radius: 40,
                    backgroundImage: AssetImage(
                      'assets/images/dp.jpg',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi! Sarah',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            color: Palette.blackColor,
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 1,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Palette.mainColor,
                              size: 16,
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                '233, Kandy Rd, Peradeniya',
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  color: Palette.mainColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
