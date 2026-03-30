import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // ⏳ Navigate after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D6B4A),
  
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// 🚀 LOGO BOX
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(child: Text("🛣", style: TextStyle(fontSize: 40))),
            ),

            SizedBox(height: 20),

            /// APP NAME
            Text(
              "RouteShare",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 8),

            /// TAGLINE
            Text(
              "Share the ride. Split the cost.\nReach faster.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.white70),
            ),

            SizedBox(height: 40),

            /// LOADING DOTS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [dot(true), dot(false), dot(false)],
            ),

            SizedBox(height: 30),

            /// LOADING TEXT
            Text(
              "Loading...",
              style: TextStyle(fontSize: 11, color: Colors.white54),
            ),
          ],
        ),
      ),
    );
  }

  /// DOT WIDGET
  Widget dot(bool active) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(active ? 1 : 0.4),
        shape: BoxShape.circle,
      ),
    );
  }
}
