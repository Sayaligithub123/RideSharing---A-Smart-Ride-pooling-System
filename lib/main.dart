import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'login_page.dart';
import 'splash_screen.dart';

// 🔥 ADD THESE IMPORTS
import 'passenger_homepage.dart';
import 'route_input_page.dart';
import 'matching_rides_page.dart';
import 'ride_detail_page.dart';
import 'waiting_page.dart';
import 'ride_confirmed_page.dart';
import 'live_tracking_page.dart';
import 'ride_summary_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      /// 🔥 START SCREEN
      home: SplashScreen(),

      /// 🔥 ROUTES (IMPORTANT)
      routes: {
  '/login': (context) => LoginPage(),

  // Passenger Flow
  '/home': (context) => PassengerHomePage(phone: "9876543210"),
  '/route': (context) => RouteInputPage(),
  '/matching': (context) => MatchingRidesPage(),
  '/detail': (context) => RideDetailPage(),
  '/waiting': (context) => WaitingPage(),

  /// 🔥 ADD THESE
  '/confirmed': (context) => RideConfirmedPage(),
  '/live': (context) => LiveTrackingPage(),
  '/summary': (context) => RideSummaryPage(),
},
    );
  }
}