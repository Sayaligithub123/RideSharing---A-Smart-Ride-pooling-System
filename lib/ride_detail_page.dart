    import 'package:flutter/material.dart';
import 'app_state.dart';
import 'waiting_page.dart';

class RideDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Ride Details"),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// 🔹 DRIVER CARD
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFFE6F7F1),
                    child: Icon(Icons.person,
                        size: 30, color: Color(0xFF1A9E6E)),
                  ),
                  SizedBox(width: 15),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppState.driverName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Swift Dzire • MH12 AB 1234",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.star,
                              color: Colors.orange, size: 16),
                          SizedBox(width: 4),
                          Text("4.5"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            /// 🔹 ROUTE DETAILS
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [

                  Row(
                    children: [
                      Icon(Icons.circle,
                          size: 12, color: Colors.green),
                      SizedBox(width: 10),
                      Text("Pickup Location"),
                    ],
                  ),

                  SizedBox(height: 10),

                  Row(
                    children: [
                      Icon(Icons.location_on,
                          size: 16, color: Colors.red),
                      SizedBox(width: 10),
                      Text("Drop Location"),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            /// 🔹 RIDE INFO
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Fare"),
                      Text(
                        "₹${AppState.fare}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A9E6E),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("ETA"),
                      Text("5 mins"),
                    ],
                  ),

                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Seats Available"),
                      Text("2"),
                    ],
                  ),
                ],
              ),
            ),

            Spacer(),

            /// 🔹 CONFIRM BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/waiting');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1A9E6E),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  "Confirm Ride →",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}