import 'package:flutter/material.dart';
import 'app_state.dart';

class MatchingRidesPage extends StatelessWidget {
  final List<Map<String, dynamic>> rides = [
    {
      "driver": "Rahul Sharma",
      "car": "Swift Dzire",
      "fare": 120,
      "eta": "5 min",
      "seats": 3,
      "rating": 4.5
    },
    {
      "driver": "Amit Verma",
      "car": "Hyundai i20",
      "fare": 100,
      "eta": "3 min",
      "seats": 2,
      "rating": 4.2
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Available Rides"),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),

      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: rides.length,
        itemBuilder: (context, index) {
          var ride = rides[index];

          return Container(
            margin: EdgeInsets.only(bottom: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade300),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// 🔹 DRIVER ROW
                Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Color(0xFFE6F7F1),
                      child: Icon(Icons.person, color: Color(0xFF1A9E6E)),
                    ),
                    SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ride["driver"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            ride["car"],
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),

                    /// 💰 PRICE
                    Text(
                      "₹${ride["fare"]}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF1A9E6E),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 12),

                /// 🔹 SMALL DETAILS (INLINE LIKE PROTOTYPE)
                Row(
                  children: [
                    Icon(Icons.access_time, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(" ${ride["eta"]}"),
                    SizedBox(width: 12),

                    Icon(Icons.event_seat, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(" ${ride["seats"]} seats"),
                    SizedBox(width: 12),

                    Icon(Icons.star, size: 16, color: Colors.orange),
                    SizedBox(width: 4),
                    Text(" ${ride["rating"]}"),
                  ],
                ),

                SizedBox(height: 14),

                /// 🔹 BUTTON
               SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    onPressed: () {
      Navigator.pushNamed(context, '/matching');
    },
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
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
)
              ],
            ),
          );
        },
      ),
    );
  }
}