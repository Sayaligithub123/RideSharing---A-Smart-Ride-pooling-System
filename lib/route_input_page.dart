import 'package:flutter/material.dart';
import 'passenger_homepage.dart';
import 'matching_rides_page.dart';

class RouteInputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Plan your ride"),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// 🔹 PICKUP + DROP CARD
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [

                  /// PICKUP
                  Row(
                    children: [
                      Icon(Icons.circle, color: Colors.green, size: 12),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Enter pickup location",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Divider(),

                  /// DROP
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          color: Colors.red, size: 16),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Where are you going?",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 15),

            /// 🔄 SWAP BUTTON
            Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFFE6F7F1),
                child: Icon(Icons.swap_vert, color: Color(0xFF1A9E6E)),
              ),
            ),

            SizedBox(height: 20),

            /// 📍 CURRENT LOCATION BUTTON
            Row(
              children: [
                Icon(Icons.my_location, color: Color(0xFF1A9E6E)),
                SizedBox(width: 10),
                Text(
                  "Use current location",
                  style: TextStyle(
                    color: Color(0xFF1A9E6E),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            SizedBox(height: 25),

            /// 🔹 RECENT LOCATIONS
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Recent places",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),

            SizedBox(height: 10),

            recentTile("Home", "Kothrud, Pune"),
            recentTile("Office", "Hinjewadi Phase 1"),

            Spacer(),

            /// 🚀 SEARCH BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1A9E6E),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  "Search Rides →",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 RECENT TILE
  Widget recentTile(String title, String subtitle) {
    return ListTile(
      leading: Icon(Icons.access_time),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {},
    );
  }
}