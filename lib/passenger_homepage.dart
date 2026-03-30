import 'package:flutter/material.dart';

class PassengerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Passenger Home"),
        backgroundColor: Color(0xFF1A9E6E),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            /// SEARCH BAR
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 10),
                  Text(
                    "Where are you going?",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Text(
              "Recent destinations",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
