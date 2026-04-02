import 'package:flutter/material.dart';
import 'multi_passenger_ride_page.dart'; // ✅ IMPORT

class PickupDetourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Pickup Details"),
        backgroundColor: Color(0xFF1A9E6E),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// 👤 PASSENGER CARD
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0xFF1A9E6E),
                    child: Text("R", style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Rahul Sharma",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Text("2 seats"),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            /// 📍 PICKUP LOCATION
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.red),
              title: Text("Pickup Location"),
              subtitle: Text("FC Road, Pune"),
            ),

            Divider(),

            /// 🛣 DETOUR INFO
            ListTile(
              leading: Icon(Icons.route, color: Colors.blue),
              title: Text("Detour"),
              subtitle: Text("+1.5 km • +5 mins"),
            ),

            SizedBox(height: 20),

            /// 💰 EARNING
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Color(0xFFE6F7F1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.attach_money, color: Colors.green),
                  SizedBox(width: 10),
                  Text(
                    "You earn ₹120 from this ride",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            Spacer(),

            /// 🚀 PICKED UP BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MultiPassengerRidePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1A9E6E),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text("Picked Up"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}