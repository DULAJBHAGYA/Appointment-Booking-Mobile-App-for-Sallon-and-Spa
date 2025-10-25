import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salon_appointment_booking_app/core/theme/palette.dart';
import 'package:salon_appointment_booking_app/core/widgets/navDrawer.dart';

class HelpInformationPage extends StatefulWidget {
  final int? selectedIndex;
  
  const HelpInformationPage({super.key, this.selectedIndex});

  @override
  State<HelpInformationPage> createState() => _HelpInformationPageState();
}

class _HelpInformationPageState extends State<HelpInformationPage> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex ?? 7; // Assuming index 7 for help & information
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      appBar: AppBar(
        backgroundColor: Palette.whiteColor,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: Palette.blackColor,
              size: 30,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/dp.jpg'),
              backgroundColor: Palette.whiteColor,
            ),
          ),
        ],
      ),
      drawer: NavDrawer(selectedIndex: _selectedIndex),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Help & Information',
                      style: GoogleFonts.italiana(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Palette.blackColor,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Find answers to common questions',
                      style: GoogleFonts.quicksand(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // FAQ Section
                    _buildSectionTitle('Frequently Asked Questions'),
                    const SizedBox(height: 15),
                    _buildFAQItem(
                      question: 'How do I book an appointment?',
                      answer: 'To book an appointment, browse salons, select a service, choose your preferred date and time, and confirm your booking. You will receive a confirmation email with details.',
                    ),
                    const SizedBox(height: 15),
                    _buildFAQItem(
                      question: 'Can I cancel or reschedule my appointment?',
                      answer: 'Yes, you can cancel or reschedule your appointment up to 24 hours before the scheduled time through the "My Appointments" section in the app.',
                    ),
                    const SizedBox(height: 15),
                    _buildFAQItem(
                      question: 'How do I find the best salon for my needs?',
                      answer: 'Our app provides detailed salon profiles, customer reviews, and service menus to help you choose the perfect salon. You can also filter by location, ratings, and services offered.',
                    ),
                    const SizedBox(height: 15),
                    _buildFAQItem(
                      question: 'What payment methods are accepted?',
                      answer: 'We accept all major credit cards, debit cards, and digital wallets. Payment is processed securely at the time of booking.',
                    ),
                    const SizedBox(height: 30),
                    
                    // Contact Section
                    _buildSectionTitle('Contact Us'),
                    const SizedBox(height: 15),
                    _buildContactOption(
                      icon: Iconsax.call,
                      title: 'Phone Support',
                      subtitle: '+1 (555) 123-4567',
                      onTap: () {
                        // TODO: Implement phone call functionality
                      },
                    ),
                    const SizedBox(height: 15),
                    _buildContactOption(
                      icon: Iconsax.sms,
                      title: 'Email Support',
                      subtitle: 'support@beautylounge.com',
                      onTap: () {
                        // TODO: Implement email functionality
                      },
                    ),
                    const SizedBox(height: 15),
                    _buildContactOption(
                      icon: Iconsax.location,
                      title: 'Office Address',
                      subtitle: '123 Beauty Street, Salon City, SC 12345',
                      onTap: () {
                        // TODO: Implement map functionality
                      },
                    ),
                    const SizedBox(height: 30),
                    
                    // About Section
                    _buildSectionTitle('About Beauty Lounge'),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Palette.whiteColor,
                        borderRadius: BorderRadius.circular(15),
                        
                      ),
                      child: Text(
                        'Beauty Lounge is your one-stop destination for all your beauty and wellness needs. We connect you with the best salons and spas in your area, offering a wide range of services from haircuts and styling to facials and massages. Our mission is to make booking beauty appointments simple, convenient, and enjoyable.\n\nWith our easy-to-use app, you can discover new salons, read real customer reviews, and book appointments 24/7. We\'re committed to helping you look and feel your best.\n\nOur team of experienced professionals works tirelessly to ensure that every aspect of your beauty journey is exceptional. From the moment you open our app to the completion of your service, we strive to provide an unparalleled experience.\n\nWe partner with only the most reputable salons and spas, ensuring that all our providers meet our high standards for quality, hygiene, and customer service. Your safety and satisfaction are our top priorities.\n\nWhether you\'re looking for a quick trim, a complete makeover, or a relaxing spa day, Beauty Lounge has you covered. Download our app today and discover the convenience of booking your next beauty appointment.',
                        style: GoogleFonts.quicksand(
                          fontSize: 14,
                          color: Colors.grey[700],
                          height: 1.6,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.italiana(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Palette.blackColor,
      ),
      textAlign: TextAlign.justify,
    );
  }

  Widget _buildFAQItem({required String question, required String answer}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Palette.whiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: GoogleFonts.quicksand(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Palette.blackColor,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
          Text(
            answer,
            style: GoogleFonts.quicksand(
              fontSize: 14,
              color: Colors.grey[600],
              height: 1.5,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget _buildContactOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Palette.whiteColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Palette.mainColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: Palette.mainColor,
                size: 16,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.quicksand(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Palette.blackColor,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: GoogleFonts.quicksand(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.justify,
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