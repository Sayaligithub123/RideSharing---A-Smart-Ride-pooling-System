import 'package:flutter/material.dart';
import 'pickup_detour_page.dart'; // ✅ IMPORTANT

class JoinRequestModal extends StatelessWidget {
  final String name;
  final String seats;

  JoinRequestModal({
    required this.name,
    required this.seats,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          /// 🔹 HANDLE BAR
          Container(
            height: 5,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          SizedBox(height: 15),

          /// 🔔 TITLE
          Text(
            "New Join Request",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 20),

          /// 👤 PASSENGER INFO CARD
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
                  child: Text(
                    name[0],
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                SizedBox(width: 15),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text("$seats requested"),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          /// ⭐ EXTRA DETAILS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              infoBox("Rating", "4.8 ⭐"),
              infoBox("Trips", "12"),
              infoBox("Payment", "Online"),
            ],
          ),

          SizedBox(height: 25),

          /// 🚀 ACTION BUTTONS
          Row(
            children: [

              /// ❌ REJECT
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context); // Stay on Active Ride
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text("Decline"),
                ),
              ),

              SizedBox(width: 10),

              /// ✅ ACCEPT
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close modal first

                    /// 🚀 NAVIGATE TO PICKUP PAGE
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PickupDetourPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1A9E6E),
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text("Accept"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 📦 SMALL INFO BOX
  Widget infoBox(String title, String value) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(title, style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}