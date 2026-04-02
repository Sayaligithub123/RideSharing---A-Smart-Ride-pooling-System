import 'package:flutter/material.dart';
import 'driver_homepage.dart'; // ✅ IMPORTANT (for navigation)

class DriverTripSummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FAFB),

      appBar: AppBar(
        title: Text("Trip Summary"),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// ✅ SUCCESS ICON + TITLE
            Icon(
              Icons.check_circle,
              color: Color(0xFF1A9E6E),
              size: 80,
            ),

            SizedBox(height: 10),

            Text(
              "Ride Completed",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 25),

            /// 💰 TOTAL EARNINGS CARD (MAIN FOCUS)
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF1A9E6E),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    "Total Earnings",
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "₹360",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),

            /// 📊 DETAILS GRID
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                detailCard("Passengers", "3"),
                detailCard("Distance", "12 km"),
              ],
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                detailCard("Duration", "25 min"),
                detailCard("Fare/Seat", "₹120"),
              ],
            ),

            SizedBox(height: 25),

            /// 👥 PASSENGER LIST
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

            Expanded(
              child: ListView(
                children: [
                  passengerTile("Rahul Sharma"),
                  passengerTile("Priya"),
                  passengerTile("Amit"),
                ],
              ),
            ),

            /// 🚀 DONE BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DriverHomePage(),
                    ),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1A9E6E),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  "Done",
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

  /// 📦 DETAIL CARD
  Widget detailCard(String title, String value) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  /// 👤 PASSENGER TILE
  Widget passengerTile(String name) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(0xFF1A9E6E),
          child: Text(
            name[0],
            style: TextStyle(color: Colors.white),
          ),
        ),
        title: Text(name),
        trailing: Icon(Icons.check_circle, color: Colors.green),
      ),
    );
  }
}