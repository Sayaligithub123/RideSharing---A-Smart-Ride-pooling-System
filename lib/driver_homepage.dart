import 'package:flutter/material.dart';

class DriverHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Driver Home"),
        backgroundColor: Color(0xFF1A9E6E),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            /// Earnings Card
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF1A9E6E),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    "Today's Earnings",
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "₹842",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            /// Start Ride Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1A9E6E),
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: Text("Start a Ride"),
            ),
          ],
        ),
      ),
    );
  }
}
