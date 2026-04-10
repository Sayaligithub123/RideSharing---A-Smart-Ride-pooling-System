import 'package:flutter/material.dart';
import 'active_ride_page.dart';

class SetDestinationPage extends StatefulWidget {
  final String phone;
  SetDestinationPage({required this.phone});

  @override
  _SetDestinationPageState createState() => _SetDestinationPageState();
}

class _SetDestinationPageState extends State<SetDestinationPage> {
  int selectedSeats = 2;
  final destinationController = TextEditingController(text: "Hadapsar, Pune");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Where are you going?"),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFFF3F4F6),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 📍 DESTINATION INPUT
            Text(
              "YOUR DESTINATION",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 6),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: destinationController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(Icons.location_on, color: Colors.grey),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            /// 🪑 SEATS SELECTOR
            Text(
              "EMPTY SEATS AVAILABLE",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [1, 2, 3].map((seat) {
                bool isSelected = selectedSeats == seat;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedSeats = seat),
                    child: Container(
                      margin: EdgeInsets.only(right: seat != 3 ? 8 : 0),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Color(0xFFE6F7F1)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected
                              ? Color(0xFF1A9E6E)
                              : Colors.grey.shade200,
                          width: isSelected ? 2 : 1.5,
                        ),
                      ),
                      child: Text(
                        "$seat",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: isSelected ? Color(0xFF0D6B4A) : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 16),

            /// 💰 EARNINGS PREVIEW CARD
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.grey.shade100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Estimated earnings with sharing",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  SizedBox(height: 8),
                  _fareRow("Solo ride earnings", "₹95", false),
                  _fareRow("With 1 shared passenger", "₹143", true),
                  _fareRow("With 2 shared passengers", "₹191", true),
                ],
              ),
            ),

            Spacer(),

            /// 🚀 GO LIVE BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ActiveRidePage(phone: widget.phone),
                    ),
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
                  "Go Live — Start Ride →",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fareRow(String label, String value, bool isGreen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 13, color: Colors.grey)),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isGreen ? Color(0xFF1A9E6E) : Colors.grey.shade800,
            ),
          ),
        ],
      ),
    );
  }
}
