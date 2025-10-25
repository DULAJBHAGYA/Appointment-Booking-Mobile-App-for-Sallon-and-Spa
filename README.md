# Beauty Lounge - Salon & Spa Appointment Booking App

A cross-platform mobile application built with Flutter for booking appointments at salons and spas. The app provides a seamless experience for customers to discover salons, browse services, and schedule appointments.

## 🚀 Features

- **User Authentication**: Sign in/up with email, Google, or Apple
- **Salon Discovery**: Browse and search for salons and spas
- **Service Catalog**: View detailed service offerings from each salon
- **Appointment Booking**: Schedule appointments with preferred date and time
- **Appointment Management**: View and manage upcoming appointments
- **Map Integration**: Locate salons on Google Maps
- **Ratings & Reviews**: Read and leave customer reviews
- **Settings**: Customize app preferences

## 🛠️ Tech Stack

### Frontend
- **Flutter**: Cross-platform mobile development framework
- **Dart**: Programming language
- **Google Fonts**: Custom typography
- **Iconsax**: Icon library for UI elements
- **Google Maps**: Location services and map integration

### Backend (Planned)
- **Firebase**: Authentication and real-time database
- **Supabase**: Alternative relational database option

## 📁 Project Structure

```
lib/
├── core/
│   ├── theme/          # App theme and styling
│   └── widgets/        # Reusable UI components
├── features/
│   ├── customer/       # Customer-facing functionality
│   │   ├── appointments/   # Appointment management
│   │   ├── help/           # Help and information
│   │   ├── home/           # Home screen
│   │   ├── map/            # Map integration
│   │   ├── salons/         # Salon browsing and details
│   │   ├── settings/       # App settings
│   │   └── profile/        # User profile
│   └── shared/
│       └── auth/       # Authentication pages
└── main.dart           # App entry point
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.32.7 or higher)
- Dart SDK
- Android Studio or Xcode for emulator/simulator
- Google Maps API key for map functionality

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/salon-appointment-booking-app.git
   ```

2. Navigate to the project directory:
   ```bash
   cd salon_appointment_booking_app
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Create a `.env` file in the root directory and add your API keys:
   ```env
   GOOGLE_MAPS_API_KEY=your_google_maps_api_key
   ```

5. Run the app:
   ```bash
   flutter run
   ```

## 📱 Supported Platforms

- iOS (12.0+)
- Android (API 21+)
- Web
- macOS
- Windows
- Linux

## 📸 Screenshots

*(Add screenshots of your app here)*

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Flutter](https://flutter.dev/)
- [Google Fonts](https://fonts.google.com/)
- [Iconsax](https://iconsax.io/)
- [Google Maps Platform](https://cloud.google.com/maps-platform)