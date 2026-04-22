import 'package:flutter/material.dart';

class WaitingPage extends StatefulWidget {
  @override
  _WaitingPageState createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {

  @override
  void initState() {
    super.initState();

    /// AUTO MOVE AFTER 3 SEC
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/confirmed');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CircularProgressIndicator(color: Color(0xFF1A9E6E)),

            SizedBox(height: 20),

            Text(
              "Finding your ride...",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Please wait while we match you",
              style: TextStyle(color: Colors.grey),
            ),

            SizedBox(height: 30),

            /// 🔴 CANCEL BUTTON ADD
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/home',
                  (route) => false,
                );
              },
              child: Text(
                "Cancel Request",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}