import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salon_appointment_booking_app/core/theme/palette.dart';
import 'package:salon_appointment_booking_app/core/widgets/navDrawer.dart';
import 'package:salon_appointment_booking_app/core/widgets/search_bar.dart';
import 'package:salon_appointment_booking_app/features/customer/home/data/dataSources/local%20data/salon_data.dart';
import 'package:salon_appointment_booking_app/features/customer/salons/presentation/widgets/salon_display_widget.dart';

class Salons extends StatefulWidget {
  final int? selectedIndex;
  
  const Salons({super.key, this.selectedIndex});

  @override
  State<Salons> createState() => _SalonsState();
}

class _SalonsState extends State<Salons> {
  late int _selectedIndex;
  List<dynamic> _salons = SalonsData.salons;
  List<dynamic> _filteredSalons = SalonsData.salons;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex ?? 1;
    _searchController.addListener(_filterSalons);
  }

  void _filterSalons() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredSalons = _salons.where((salon) {
        final name = salon['name'].toLowerCase();
        final address = salon['address'].toLowerCase();
        return name.contains(query) || address.contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterSalons);
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Salons',
                style: GoogleFonts.italiana(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Palette.blackColor,
                ),
              ),
              const SizedBox(height: 10),
              CustomSearchBar(
                controller: _searchController,
                onChanged: (value) {
                  _filterSalons();
                },
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredSalons.length,
                  itemBuilder: (context, index) {
                    final salon = _filteredSalons[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: SalonDisplayWidget(
                        image: salon['image'],
                        name: salon['name'],
                        rating: (salon['rating'] as num).toDouble(),
                        distance: (salon['distance'] as num).toDouble(),
                        email: salon['email'],
                        contact: salon['contact'],
                        address: salon['address'],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}