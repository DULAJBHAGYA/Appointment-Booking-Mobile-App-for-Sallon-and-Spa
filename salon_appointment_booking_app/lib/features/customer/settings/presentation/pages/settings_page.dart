import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salon_appointment_booking_app/core/theme/palette.dart';
import 'package:salon_appointment_booking_app/core/widgets/navDrawer.dart';

class SettingsPage extends StatefulWidget {
  final int? selectedIndex;
  const SettingsPage({super.key, this.selectedIndex});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late int _selectedIndex;

  // Settings state variables
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  String _selectedLanguage = 'English';
  String _selectedCurrency = 'USD';

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex ?? 5;
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
            children: [
              // Profile Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Palette.mainColor,
                          width: 3,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/dp.jpg'),
                        backgroundColor: Palette.whiteColor,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Sarah Smith',
                      style: GoogleFonts.quicksand(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Palette.blackColor,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'sarahsmith@gmail.com',
                      style: GoogleFonts.quicksand(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.all(10),
                        backgroundColor: Palette.mainColor,
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        // TODO: Navigate to edit profile
                      },
                      child: Text(
                        'Edit Profile',
                        style: GoogleFonts.quicksand(
                          fontSize: 14,
                          color: Palette.whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Settings List
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    _buildSettingItem(
                      icon: Iconsax.notification_1,
                      title: 'Notifications',
                      subtitle: 'Manage your notification preferences',
                      onTap: () {
                        _showNotificationSettings();
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildSettingItem(
                      icon: Iconsax.card,
                      title: 'Payments',
                      subtitle: 'Payment methods & transaction history',
                      onTap: () {
                        // TODO: Navigate to payments
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildSettingItem(
                      icon: Iconsax.location,
                      title: 'Manage Address',
                      subtitle: 'Reorder your favorite service in a click',
                      onTap: () {
                        // TODO: Navigate to address management
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildSettingItem(
                      icon: Iconsax.moon,
                      title: 'Appearance',
                      subtitle: 'Dark mode and theme settings',
                      onTap: () {
                        _showAppearanceSettings();
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildSettingItem(
                      icon: Iconsax.global,
                      title: 'Language & Currency',
                      subtitle: 'Change app language and currency',
                      onTap: () {
                        _showLanguageCurrencySettings();
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildSettingItem(
                      icon: Iconsax.security_user,
                      title: 'Privacy & Security',
                      subtitle: 'Manage your privacy settings',
                      onTap: () {
                        // TODO: Navigate to privacy settings
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildSettingItem(
                      icon: Iconsax.logout,
                      title: 'Logout',
                      subtitle: 'Sign out from your account',
                      onTap: () {
                        _showLogoutDialog();
                      },
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem({
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
          borderRadius: BorderRadius.circular(15),
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
                borderRadius: BorderRadius.circular(12),
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
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.quicksand(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }

  void _showNotificationSettings() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Notification Settings',
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SwitchListTile(
                    title: Text(
                      'Push Notifications',
                      style: GoogleFonts.quicksand(fontSize: 16),
                    ),
                    value: _notificationsEnabled,
                    activeColor: Palette.mainColor,
                    onChanged: (value) {
                      setState(() {
                        _notificationsEnabled = value;
                      });
                      setModalState(() {
                        _notificationsEnabled = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showAppearanceSettings() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Appearance',
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SwitchListTile(
                    title: Text(
                      'Dark Mode',
                      style: GoogleFonts.quicksand(fontSize: 16),
                    ),
                    value: _darkModeEnabled,
                    activeColor: Palette.mainColor,
                    onChanged: (value) {
                      setState(() {
                        _darkModeEnabled = value;
                      });
                      setModalState(() {
                        _darkModeEnabled = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showLanguageCurrencySettings() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Language & Currency',
                style: GoogleFonts.quicksand(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: Icon(Iconsax.global, color: Palette.mainColor),
                title: Text(
                  'Language',
                  style: GoogleFonts.quicksand(fontSize: 16),
                ),
                trailing: Text(
                  _selectedLanguage,
                  style: GoogleFonts.quicksand(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _showLanguageSelectionDialog();
                },
              ),
              ListTile(
                leading: Icon(Iconsax.money_2, color: Palette.mainColor),
                title: Text(
                  'Currency',
                  style: GoogleFonts.quicksand(fontSize: 16),
                ),
                trailing: Text(
                  _selectedCurrency,
                  style: GoogleFonts.quicksand(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _showCurrencySelectionDialog();
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _showLanguageSelectionDialog() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Language',
                style: GoogleFonts.quicksand(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _buildLanguageOption('English', _selectedLanguage == 'English'),
              _buildLanguageOption('Spanish', _selectedLanguage == 'Spanish'),
              _buildLanguageOption('French', _selectedLanguage == 'French'),
              _buildLanguageOption('German', _selectedLanguage == 'German'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(String language, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedLanguage = language;
        });
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[200]!,
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              language,
              style: GoogleFonts.quicksand(
                fontSize: 16,
                color: Palette.blackColor,
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check,
                color: Palette.mainColor,
              ),
          ],
        ),
      ),
    );
  }

  void _showCurrencySelectionDialog() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Currency',
                style: GoogleFonts.quicksand(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _buildCurrencyOption('USD - US Dollar', _selectedCurrency == 'USD'),
              _buildCurrencyOption('EUR - Euro', _selectedCurrency == 'EUR'),
              _buildCurrencyOption('GBP - British Pound', _selectedCurrency == 'GBP'),
              _buildCurrencyOption('JPY - Japanese Yen', _selectedCurrency == 'JPY'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCurrencyOption(String currency, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCurrency = currency.substring(0, 3);
        });
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[200]!,
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              currency,
              style: GoogleFonts.quicksand(
                fontSize: 16,
                color: Palette.blackColor,
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check,
                color: Palette.mainColor,
              ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            'Logout',
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure you want to logout?',
            style: GoogleFonts.quicksand(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: GoogleFonts.quicksand(
                  color: Colors.grey[600],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // TODO: Implement logout
                Navigator.pop(context);
              },
              child: Text(
                'Logout',
                style: GoogleFonts.quicksand(
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
}