import 'package:flutter/material.dart';
import 'package:salon_appointment_booking_app/core/theme/palette.dart';

class HomeAppointmentDisplayContainer extends StatelessWidget {
  final String date;
  final String startTime;
  final String salon;

  const HomeAppointmentDisplayContainer({
    required this.date,
    required this.startTime,
    required this.salon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 30,
      ),
      decoration: BoxDecoration(
        color: Palette.mainColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      height: 130,
      width: MediaQuery.of(context).size.width - 40,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Appointment',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Spacer(),
                Text(
                  date + '  ' + startTime,
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Palette.whiteColor,
                  size: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  'At the $salon',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                backgroundColor: Palette.blackColor,
                radius: 20,
                child: Icon(
                  Icons.arrow_forward,
                  color: Palette.whiteColor,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
