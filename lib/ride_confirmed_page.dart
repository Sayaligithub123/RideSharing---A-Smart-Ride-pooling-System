import 'package:flutter/material.dart';
import 'app_state.dart';
import 'live_tracking_page.dart';
class RideConfirmedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            SizedBox(height: 80),

            Icon(Icons.check_circle,
                size: 80, color: Color(0xFF1A9E6E)),

            SizedBox(height: 20),

            Text(
              "Ride Confirmed!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Driver ${AppState.driverName} is on the way",
              style: TextStyle(color: Colors.grey),
            ),

            SizedBox(height: 30),

            /// DRIVER CARD
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0xFFE6F7F1),
                    child: Icon(Icons.person,
                        color: Color(0xFF1A9E6E)),
                  ),
                  SizedBox(width: 12),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppState.driverName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold)),
                      Text("Car arriving in 5 mins"),
                    ],
                  ),
                ],
              ),
            ),

            Spacer(),

            /// BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/live');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1A9E6E),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text("Track Ride →"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}