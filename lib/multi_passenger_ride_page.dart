import 'package:flutter/material.dart';
import 'driver_trip_summary_page.dart'; // ✅ IMPORT

class MultiPassengerRidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Ride in Progress"),
        backgroundColor: Color(0xFF1A9E6E),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// 🟢 RIDE STATUS
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Color(0xFFE6F7F1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.directions_car, color: Colors.green),
                  SizedBox(width: 10),
                  Text(
                    "Ride in Progress",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            /// 📍 ROUTE INFO (Optional but matches prototype)
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle, size: 10, color: Colors.green),
                      SizedBox(width: 10),
                      Expanded(child: Text("Current Location")),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.red),
                      SizedBox(width: 10),
                      Expanded(child: Text("Destination")),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            /// 👥 PASSENGERS TITLE
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Passengers",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 10),

            /// 📋 PASSENGER LIST
            Expanded(
              child: ListView(
                children: [
                  passengerCard("Rahul Sharma", "2 seats"),
                  passengerCard("Priya", "1 seat"),
                  passengerCard("Amit", "1 seat"),
                ],
              ),
            ),

            /// 🛑 COMPLETE RIDE BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DriverTripSummaryPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  "Complete Ride",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 👤 PASSENGER CARD
  Widget passengerCard(String name, String seats) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(0xFF1A9E6E),
          child: Text(
            name[0],
            style: TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(seats),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 5),
            Text("Onboard"),
          ],
        ),
      ),
    );
  }
}