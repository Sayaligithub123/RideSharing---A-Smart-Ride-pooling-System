import 'package:flutter/material.dart';
import 'ride_summary_page.dart';

class LiveTrackingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [

          /// MAP
          Container(
            color: Color(0xFFE6F7F1),
            child: Center(child: Text("🗺 Live Map")),
          ),

          /// BOTTOM CARD
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Text(
                    "Driver arriving soon",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/summary');
                    },
                    child: Text("End Ride"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}