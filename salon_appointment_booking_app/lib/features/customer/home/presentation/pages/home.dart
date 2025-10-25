import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salon_appointment_booking_app/core/theme/palette.dart';
import 'package:salon_appointment_booking_app/core/widgets/navDrawer.dart';
import 'package:salon_appointment_booking_app/core/widgets/search_bar.dart';
import 'package:salon_appointment_booking_app/features/customer/home/presentation/widgets/appointmnet_display_card.dart';
import 'package:salon_appointment_booking_app/features/customer/home/presentation/widgets/nearest_salons.dart';
import 'package:salon_appointment_booking_app/features/customer/home/presentation/widgets/services_menu.dart';

class Home extends StatefulWidget {
  final int? selectedIndex;
  
  const Home({super.key, this.selectedIndex});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int _selectedIndex;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex ?? 0;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
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
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to',
                  style: GoogleFonts.italiana(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Palette.blackColor,
                  ),
                ),
                Text(
                  'Beauty Lounge',
                  style: GoogleFonts.italiana(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Palette.mainColor,
                  ),
                ),
                const SizedBox(height: 20),
                CustomSearchBar(controller: _searchController, onChanged: (value) {}),
                const SizedBox(height: 40),
                ServicesMenu(),
                const SizedBox(height: 40),
                NearestSalons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}