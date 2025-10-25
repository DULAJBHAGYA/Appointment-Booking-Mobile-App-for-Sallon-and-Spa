import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salon_appointment_booking_app/core/theme/palette.dart';
import 'package:salon_appointment_booking_app/core/widgets/navDrawer.dart';
import 'package:salon_appointment_booking_app/core/widgets/search_bar.dart';
import 'package:salon_appointment_booking_app/features/customer/appointments/presentation/widgets/appointment_display_widget.dart';
import 'package:salon_appointment_booking_app/features/customer/home/data/dataSources/local%20data/appointments_data.dart';

class Appointments extends StatefulWidget {
  final int? selectedIndex;
  
  const Appointments({super.key, this.selectedIndex});

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  late int _selectedIndex;
  List<dynamic> _appointments = AppointmentsData.appointments;
  List<dynamic> _filteredAppointments = AppointmentsData.appointments;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex ?? 3; // Assuming index 3 for appointments
    _searchController.addListener(_filterAppointments);
  }

  void _filterAppointments() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredAppointments = _appointments.where((appointment) {
        final salon = appointment['salon'].toLowerCase();
        final address = appointment['address'].toLowerCase();
        return salon.contains(query) || address.contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterAppointments);
    _searchController.dispose();
    super.dispose();
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
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Appointments',
                style: GoogleFonts.italiana(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Palette.blackColor,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Manage your upcoming appointments',
                style: GoogleFonts.quicksand(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 20),
              CustomSearchBar(
                controller: _searchController,
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              Expanded(
                child: _filteredAppointments.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Iconsax.calendar_1,
                              size: 60,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'No appointments found',
                              style: GoogleFonts.quicksand(
                                fontSize: 18,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'You don\'t have any upcoming appointments',
                              style: GoogleFonts.quicksand(
                                fontSize: 14,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: _filteredAppointments.length,
                        itemBuilder: (context, index) {
                          final appointment = _filteredAppointments[index];
                          return AppointmentDisplayWidget(
                            salon: appointment['salon'],
                            date: appointment['date'],
                            startTime: appointment['start_time'],
                            address: appointment['address'],
                            service: appointment['service'] ?? 'Service not specified',
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