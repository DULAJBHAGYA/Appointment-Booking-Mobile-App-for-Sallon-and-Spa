import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salon_appointment_booking_app/core/theme/palette.dart';

class MakeReservationPage extends StatefulWidget {
  final String salonName;
  final String salonImage;
  
  const MakeReservationPage({
    super.key,
    required this.salonName,
    required this.salonImage,
  });

  @override
  State<MakeReservationPage> createState() => _MakeReservationPageState();
}

class _MakeReservationPageState extends State<MakeReservationPage> {
  int _selectedDateIndex = 2; // Default to Wednesday
  String _selectedTimeSlot = '09:30 AM';
  int? _selectedSpecialistIndex;
  String? _selectedService;

  final List<Map<String, dynamic>> _weekDays = [
    {'day': 'Sun', 'date': '02'},
    {'day': 'Mon', 'date': '03'},
    {'day': 'Tue', 'date': '04'},
    {'day': 'Wed', 'date': '05'},
    {'day': 'Thu', 'date': '06'},
    {'day': 'Fri', 'date': '07'},
    {'day': 'Sat', 'date': '08'},
  ];

  final List<String> _morningSlots = [
    '09:00 AM',
    '09:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
  ];

  final List<String> _afternoonSlots = [
    '12:00 PM',
    '12:30 PM',
    '01:00 PM',
    '01:30 PM',
    '02:00 PM',
    '02:30 PM',
  ];

  final List<String> _eveningSlots = [
    '03:00 PM',
    '03:30 PM',
    '04:00 PM',
    '04:30 PM',
    '05:00 PM',
    '05:30 PM',
  ];

  final List<Map<String, String>> _specialists = [
    {'name': 'Clay Burke', 'image': 'assets/images/dp.jpg'},
    {'name': 'Eileen Rose', 'image': 'assets/images/dp.jpg'},
    {'name': 'Hair Expert', 'image': 'assets/images/dp.jpg'},
    {'name': 'Cesar Wu', 'image': 'assets/images/dp.jpg'},
    {'name': 'Simon R.', 'image': 'assets/images/dp.jpg'},
  ];

  final List<Map<String, dynamic>> _services = [
    {'name': 'Haircut', 'icon': Iconsax.scissor},
    {'name': 'Hair Color', 'icon': Iconsax.brush_2},
    {'name': 'Massage', 'icon': Iconsax.heart},
    {'name': 'Facial', 'icon': Iconsax.emoji_happy},
    {'name': 'Manicure', 'icon': Iconsax.personalcard},
    {'name': 'Pedicure', 'icon': Iconsax.lovely},
  ];

  void _handleMakeReservation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Palette.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Reservation Confirmed',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: Palette.blackColor,
            ),
          ),
          content: Text(
            'Your reservation at ${widget.salonName} has been confirmed!',
            style: GoogleFonts.poppins(
              color: Palette.blackColor,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: GoogleFonts.poppins(
                  color: Palette.mainColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTimeSlotSection(String title, List<String> slots) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Palette.blackColor,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: slots.map((time) {
            final isSelected = _selectedTimeSlot == time;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTimeSlot = time;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? Palette.mainColor : Palette.whiteColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isSelected ? Palette.mainColor : Colors.grey[300]!,
                    width: 1,
                  ),
                  boxShadow: [
                    if (isSelected)
                      BoxShadow(
                        color: Palette.mainColor.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                  ],
                ),
                child: Text(
                  time,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: isSelected ? Palette.whiteColor : Palette.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Palette.whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Iconsax.arrow_left_2,
            color: Palette.blackColor,
            size: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.salonName,
          style: GoogleFonts.italiana(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Palette.blackColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Month Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'October',
                      style: GoogleFonts.quicksand(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Palette.blackColor,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Palette.blackColor,
                      size: 18,
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Week Days Calendar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(_weekDays.length, (index) {
                    final day = _weekDays[index];
                    final isSelected = _selectedDateIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDateIndex = index;
                        });
                      },
                      child: Container(
                        width: 45,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: isSelected ? Palette.mainColor : Palette.whiteColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected ? Palette.mainColor : Colors.grey[300]!,
                            width: 1,
                          ),
                          boxShadow: [
                            if (isSelected)
                              BoxShadow(
                                color: Palette.mainColor.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              day['day']!,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: isSelected ? Palette.whiteColor : Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              day['date']!,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: isSelected ? Palette.whiteColor : Palette.blackColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 30),

                // Service Selection
                Text(
                  'Select Service',
                  style: GoogleFonts.quicksand(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Palette.blackColor,
                  ),
                ),
                const SizedBox(height: 15),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: _services.map((service) {
                    final isSelected = _selectedService == service['name'];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedService = service['name'];
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: isSelected ? Palette.mainColor : Palette.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isSelected ? Palette.mainColor : Colors.grey[300]!,
                            width: 1,
                          ),
                          boxShadow: [
                            if (isSelected)
                              BoxShadow(
                                color: Palette.mainColor.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              service['icon'],
                              size: 18,
                              color: isSelected ? Palette.whiteColor : Palette.mainColor,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              service['name'],
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: isSelected ? Palette.whiteColor : Palette.blackColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 30),

                // Morning Slots
                _buildTimeSlotSection('Morning', _morningSlots),
                const SizedBox(height: 25),

                // Afternoon Slots
                _buildTimeSlotSection('Afternoon', _afternoonSlots),
                const SizedBox(height: 25),

                // Evening Slots
                _buildTimeSlotSection('Evening', _eveningSlots),
                const SizedBox(height: 30),

                // Choose Specialist Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Choose Specialist',
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Palette.blackColor,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Palette.blackColor,
                      size: 16,
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // Specialists List
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _specialists.length,
                    itemBuilder: (context, index) {
                      final specialist = _specialists[index];
                      final isSelected = _selectedSpecialistIndex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedSpecialistIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected ? Palette.mainColor : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 28,
                                      backgroundImage: AssetImage(specialist['image']!),
                                      backgroundColor: Colors.grey[300],
                                    ),
                                    if (isSelected)
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          width: 18,
                                          height: 18,
                                          decoration: BoxDecoration(
                                            color: Palette.mainColor,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Palette.whiteColor,
                                              width: 2,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.check,
                                            size: 10,
                                            color: Palette.whiteColor,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                specialist['name']!.split(' ')[0],
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),

                // Booking Summary Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Palette.whiteColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            color: Palette.mainColor,
                            size: 18,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '${_weekDays[_selectedDateIndex]['date']} Oct, ${_weekDays[_selectedDateIndex]['day']}day',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Palette.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            _selectedTimeSlot,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Palette.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      if (_selectedService != null) ...[
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Iconsax.category,
                              color: Palette.mainColor,
                              size: 18,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              _selectedService!,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Palette.blackColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                      const SizedBox(height: 15),
                      Text(
                        'Confirm Your Booking Details And Get Ready For A Smooth Salon Experience.',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.grey[600],
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _handleMakeReservation,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Palette.mainColor,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.calendar_today_rounded,
                                color: Palette.whiteColor,
                                size: 18,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Book Now',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Palette.whiteColor,
                                  fontWeight: FontWeight.w600,
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
        ),
      ),
    );
  }
}