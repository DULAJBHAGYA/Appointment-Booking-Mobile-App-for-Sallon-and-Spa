import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salon_appointment_booking_app/core/theme/palette.dart';
import 'package:salon_appointment_booking_app/features/customer/appointments/presentation/pages/appointments.dart';
import 'package:salon_appointment_booking_app/features/customer/home/presentation/pages/home.dart';
import 'package:salon_appointment_booking_app/features/customer/salons/presentation/pages/salons.dart';
import 'package:salon_appointment_booking_app/features/customer/map/presentation/pages/map_page.dart';
import 'package:salon_appointment_booking_app/features/customer/settings/presentation/pages/settings_page.dart';
import 'package:salon_appointment_booking_app/features/customer/help/presentation/pages/help_information_page.dart';
import 'package:salon_appointment_booking_app/features/shared/auth/presentation/pages/sign_in_page.dart';

class NavDrawer extends StatefulWidget {
  final int? selectedIndex;
  
  const NavDrawer({super.key, this.selectedIndex});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Container(
        margin: const EdgeInsets.only(top: 50), // Adding top margin
        child: Column(
          children: [
            // Header with user info
            Container(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
              child: Row(
                children: [
                  Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.only(right: 15),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/dp.jpg'),
                backgroundColor: Palette.whiteColor,
              ),
            ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sarah Smith',
                          style: GoogleFonts.quicksand(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'No:22, Main Street, Kandy',
                          style: GoogleFonts.quicksand(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          


            // Menu items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  _buildMenuItem(
                    icon: Iconsax.home,
                    label: 'Home',
                    index: 0,
                    onTap: () {
                      setState(() => _selectedIndex = 0);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home(selectedIndex: 0)),
                      );
                    },
                  ),
                  _buildMenuItem(
                    icon: Iconsax.scissor_1,
                    label: 'Sallons',
                    index: 1,
                    onTap: () {
                      setState(() => _selectedIndex = 1);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Salons(selectedIndex: 1)),
                      );
                    },
                  ),
                  _buildMenuItem(
                    icon: Iconsax.brush_1,
                    label: 'Services',
                    index: 2,
                    onTap: () {
                      setState(() => _selectedIndex = 2);
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.check_circle_outline,
                    label: 'Reservations',
                    index: 3,
                    notificationCount: 3,
                    onTap: () {
                      setState(() => _selectedIndex = 3);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Appointments(selectedIndex: 3)),
                      );
                    },
                  ),
                  _buildMenuItem(
                    icon: Iconsax.map,
                    label: 'Map',
                    badge: 'New',
                    index: 4,
                    onTap: () {
                      setState(() => _selectedIndex = 4);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MapPage(selectedIndex: 4)),
                      );
                    },
                  ),
                  _buildMenuItem(
                    icon: Iconsax.activity,
                    label: 'History',
                    index: 5,
                    onTap: () {
                      setState(() => _selectedIndex = 5);
                    },
                  ),
                ],
              ),
            ),

            // Upgrade to Pro section
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Starting Promotions',
                        style: GoogleFonts.quicksand(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      Icon(Icons.rocket_launch, size: 16, color: Colors.grey[600]),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Get 30% off on all services in first month',
                    style: GoogleFonts.quicksand(
                      fontSize: 12,
                      color: Colors.grey[600],
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Palette.mainColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Claim Promotion',
                        style: GoogleFonts.quicksand(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom options
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                children: [
                  _buildBottomMenuItem(
                    icon: Iconsax.message_question,
                    label: 'Help & Information',
                    onTap: () {
                      setState(() => _selectedIndex = 7); // Assuming index 7 for help & information
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HelpInformationPage(selectedIndex: 7)),
                      );
                    },
                  ),
                  _buildBottomMenuItem(
                    icon: Iconsax.setting,
                    label: 'Settings',
                    onTap: () {
                      setState(() => _selectedIndex = 6); // Assuming index 6 for settings
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsPage(selectedIndex: 6)),
                      );
                    },
                  ),
                  _buildBottomMenuItem(
                    icon: Iconsax.logout,
                    label: 'Log Out',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required int index,
    String? badge,
    int? notificationCount,
    bool hasArrow = false,
    required VoidCallback onTap,
  }) {
    final isSelected = _selectedIndex == index;

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: isSelected ? Palette.mainColor.withOpacity(0.1) : Colors.transparent, // Using a lighter version of main color for better visibility
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected ? Palette.mainColor : Colors.grey[700],
          size: 22,
        ),
        title: Text(
          label,
          style: GoogleFonts.quicksand(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected ? Colors.black87 : Colors.grey[800],
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (badge != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Palette.mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  badge,
                  style: GoogleFonts.quicksand(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            if (notificationCount != null)
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Palette.mainColor,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  notificationCount.toString(),
                  style: GoogleFonts.quicksand(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            if (hasArrow)
              Icon(Icons.chevron_right, color: Colors.grey[400], size: 20),
          ],
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        onTap: onTap,
      ),
    );
  }

  Widget _buildBottomMenuItem({
    required IconData icon,
    required String label,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[600], size: 20),
      title: Text(
        label,
        style: GoogleFonts.quicksand(
          fontSize: 14,
          color: Colors.grey[700],
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      dense: true,
      onTap: onTap ?? () {
        if (label == 'Log Out') {
          _showLogoutConfirmation(context);
        }
      },
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Log Out',
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure you want to log out?',
            style: GoogleFonts.quicksand(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'Cancel',
                style: GoogleFonts.quicksand(
                  color: Colors.grey[600],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Navigate to sign in page
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInPage()),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Palette.mainColor,
                foregroundColor: Colors.white,
              ),
              child: Text(
                'Yes',
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}