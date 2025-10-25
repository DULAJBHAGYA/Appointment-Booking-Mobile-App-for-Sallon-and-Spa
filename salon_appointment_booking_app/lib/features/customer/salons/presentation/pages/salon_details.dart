import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salon_appointment_booking_app/core/theme/palette.dart';
import 'package:salon_appointment_booking_app/features/customer/salons/presentation/pages/make_reservation_page.dart';

class SalonDetails extends StatefulWidget {
  final String image;
  final String name;
  final double rating;
  final double distance;
  final String email;
  final String contact;
  final String address;

  const SalonDetails({
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
  State<SalonDetails> createState() => _SalonDetailsState();
}

class _SalonDetailsState extends State<SalonDetails> {
  late double _rating;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipPath(
                        clipper: MyClipper(),
                        child: Container(
                          height: 350,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(widget.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // First column: Name and distance
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Salon name
                                  Text(
                                    widget.name,
                                    style: GoogleFonts.italiana(
                                      fontSize: 36,
                                      fontWeight: FontWeight.w600,
                                      color: Palette.blackColor,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  // Distance information
                                  Text(
                                    '${widget.distance} km away',
                                    style: GoogleFonts.quicksand(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Second column: Ratings
                            Column(
                              children: [
                                Text(
                                  '${widget.rating}',
                                  style: GoogleFonts.inter(
                                    fontSize: 50,
                                    color: Palette.blackColor,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                PannableRatingBar(
                                  rate: widget.rating,
                                  items: List.generate(
                                      5,
                                      (index) => const RatingWidget(
                                            selectedColor: Palette.ratingColor,
                                            unSelectedColor: Palette.greyColor,
                                            child: Icon(
                                              Icons.star,
                                              size: 16,
                                            ),
                                          )),
                                  onChanged: (value) {
                                    setState(() {
                                      _rating = widget.rating;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        
                        // Services Section Title
                        Text(
                          'Avialable Services',
                          style: GoogleFonts.italiana(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Palette.blackColor,
                          ),
                        ),
                        SizedBox(height: 5),
                        // Service Images Section
                        Container(
                          height: 150,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              _buildServiceImage('assets/images/hair_cut_menu.jpg'),
                              _buildServiceImage('assets/images/hair_coloring_menu.jpg'),
                              _buildServiceImage('assets/images/facial_menu.jpg'),
                              _buildServiceImage('assets/images/manicure_menu.jpg'),
                              _buildServiceImage('assets/images/massage_menu.jpg'),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        // Customer Reviews Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Customer Reviews',
                              style: GoogleFonts.italiana(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Palette.blackColor,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // TODO: Navigate to all reviews page
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('View all reviews functionality will be implemented'),
                                    backgroundColor: Palette.mainColor,
                                  ),
                                );
                              },
                              child: Text(
                                'View All',
                                style: GoogleFonts.quicksand(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Palette.mainColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Review 1
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Palette.whiteColor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sarah Johnson',
                                    style: GoogleFonts.quicksand(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Palette.blackColor,
                                    ),
                                  ),
                                  PannableRatingBar(
                                    rate: 5.0,
                                    items: List.generate(
                                        5,
                                        (index) => const RatingWidget(
                                              selectedColor: Palette.ratingColor,
                                              unSelectedColor: Palette.greyColor,
                                              child: Icon(
                                                Icons.star,
                                                size: 14,
                                              ),
                                            )),
                                    onChanged: (value) {},
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                'June 15, 2023',
                                style: GoogleFonts.quicksand(
                                  fontSize: 12,
                                  color: Colors.grey[500],
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Absolutely wonderful experience! The staff was professional and the service was top-notch. Will definitely be coming back.',
                                style: GoogleFonts.quicksand(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        // Review 2
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Palette.whiteColor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Michael Chen',
                                    style: GoogleFonts.quicksand(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Palette.blackColor,
                                    ),
                                  ),
                                  PannableRatingBar(
                                    rate: 4.0,
                                    items: List.generate(
                                        5,
                                        (index) => const RatingWidget(
                                              selectedColor: Palette.ratingColor,
                                              unSelectedColor: Palette.greyColor,
                                              child: Icon(
                                                Icons.star,
                                                size: 14,
                                              ),
                                            )),
                                    onChanged: (value) {},
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                'May 28, 2023',
                                style: GoogleFonts.quicksand(
                                  fontSize: 12,
                                  color: Colors.grey[500],
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Great service and friendly staff. The salon was clean and the appointment started on time. Only reason for 4 stars is the wait time for my specific service was a bit longer than expected.',
                                style: GoogleFonts.quicksand(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        // Review 3
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Palette.whiteColor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Emma Rodriguez',
                                    style: GoogleFonts.quicksand(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Palette.blackColor,
                                    ),
                                  ),
                                  PannableRatingBar(
                                    rate: 5.0,
                                    items: List.generate(
                                        5,
                                        (index) => const RatingWidget(
                                              selectedColor: Palette.ratingColor,
                                              unSelectedColor: Palette.greyColor,
                                              child: Icon(
                                                Icons.star,
                                                size: 14,
                                              ),
                                            )),
                                    onChanged: (value) {},
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                'April 10, 2023',
                                style: GoogleFonts.quicksand(
                                  fontSize: 12,
                                  color: Colors.grey[500],
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Best salon experience I\'ve had in years! The stylist listened to exactly what I wanted and delivered beyond my expectations. The ambiance was relaxing and the prices are reasonable.',
                                style: GoogleFonts.quicksand(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        // Contact Information Section
                        Text(
                          'Contact Information',
                          style: GoogleFonts.italiana(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Palette.blackColor,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Palette.whiteColor,
                            
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Email
                              Row(
                                children: [
                                  Icon(
                                    Iconsax.sms,
                                    color: Palette.mainColor,
                                    size: 14,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    widget.email,
                                    style: GoogleFonts.quicksand(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              // Phone
                              Row(
                                children: [
                                  Icon(
                                    Iconsax.call,
                                    color: Palette.mainColor,
                                    size: 14,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    widget.contact,
                                    style: GoogleFonts.quicksand(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              // Address
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Iconsax.location,
                                    color: Palette.mainColor,
                                    size: 14,
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      widget.address,
                                      style: GoogleFonts.quicksand(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              // Get Directions Button
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // TODO: Implement directions functionality
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Directions functionality will be implemented'),
                                        backgroundColor: Palette.mainColor,
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Palette.whiteColor,
                                    foregroundColor: Palette.mainColor,
                                    padding: const EdgeInsets.symmetric(vertical: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                        color: Palette.mainColor,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Get Directions',
                                        style: GoogleFonts.quicksand(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Icon(
                                        Iconsax.direct_right5,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                             
                            ],
                          ),
                        ),
                        SizedBox(height: 80), // Add extra space at bottom for floating button
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Sticky Back Button
          Positioned(
            top: 50,
            left: 20,
            child: IconButton(
              icon: Icon(
                Iconsax.arrow_circle_left5,
                color: Palette.whiteColor,
                size: 40,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          // Floating Make Reservation Button
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MakeReservationPage(
                        salonName: widget.name,
                        salonImage: widget.image,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Palette.mainColor,
                  foregroundColor: Palette.whiteColor,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Make Reservation',
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Iconsax.arrow_right_14,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build service image widgets
  Widget _buildServiceImage(String imagePath) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          imagePath,
          width: 120,
          height: 120,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, size.height - 40);

    // Smooth wave curve suitable for salon app
    final firstControlPoint = Offset(size.width * 0.25, size.height);
    final firstEndPoint = Offset(size.width * 0.5, size.height - 20);
    
    path.quadraticBezierTo(
      firstControlPoint.dx, 
      firstControlPoint.dy, 
      firstEndPoint.dx, 
      firstEndPoint.dy
    );

    final secondControlPoint = Offset(size.width * 0.75, size.height - 40);
    final secondEndPoint = Offset(size.width, size.height - 20);
    
    path.quadraticBezierTo(
      secondControlPoint.dx, 
      secondControlPoint.dy, 
      secondEndPoint.dx, 
      secondEndPoint.dy
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
