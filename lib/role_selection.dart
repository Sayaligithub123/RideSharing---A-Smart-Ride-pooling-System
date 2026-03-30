import 'package:flutter/material.dart';
import 'profile_setup.dart'; // make sure path is correct

class RoleSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Select Role"),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20),

            /// TITLE
            Text(
              "How will you use RouteShare?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 8),

            Text(
              "You can change this anytime",
              style: TextStyle(color: Colors.grey),
            ),

            SizedBox(height: 30),

            /// 🚶 PASSENGER CARD
            roleCard(
              context,
              icon: "🧍",
              title: "Passenger",
              subtitle: "Find and share rides",
              color: Color(0xFFE6F7F1),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfileSetupPage(role: "passenger"),
                  ),
                );
              },
            ),

            SizedBox(height: 15),

            /// 🚗 DRIVER CARD
            roleCard(
              context,
              icon: "🚗",
              title: "Driver",
              subtitle: "Offer rides & earn",
              color: Colors.grey.shade100,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfileSetupPage(role: "driver"),
                  ),
                );
              },
            ),

            SizedBox(height: 15),

            /// 🔄 BOTH (optional)
          ],
        ),
      ),
    );
  }

  /// 🔹 REUSABLE CARD WIDGET
  Widget roleCard(
    BuildContext context, {
    required String icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Text(icon, style: TextStyle(fontSize: 28)),

            SizedBox(width: 15),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

                Text(subtitle, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
