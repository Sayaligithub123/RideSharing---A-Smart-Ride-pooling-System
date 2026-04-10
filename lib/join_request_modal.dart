import 'package:flutter/material.dart';
import 'pickup_detour_page.dart';

class JoinRequestModal extends StatelessWidget {
  final String name;
  final String seats;
  final String phone;

  JoinRequestModal({
    required this.name,
    required this.seats,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// HANDLE BAR
          Container(
            height: 5,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          SizedBox(height: 10),

          /// ⚡ TITLE
          Text(
            "⚡ NEW JOIN REQUEST",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF59E0B),
              letterSpacing: 0.5,
            ),
          ),
          Text(
            "Respond within 60 seconds",
            style: TextStyle(fontSize: 11, color: Colors.grey),
          ),

          SizedBox(height: 16),

          /// 👤 PASSENGER INFO CARD
          Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.grey.shade100),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Color(0xFFFEF3C7),
                      child: Text(
                        name[0],
                        style: TextStyle(
                          color: Color(0xFF92400E),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text("⭐", style: TextStyle(fontSize: 12)),
                            SizedBox(width: 4),
                            Text(
                              "4.7 · 28 rides",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Pickup: 0.8 km off your route",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),

                Divider(height: 20),

                /// 💰 FARE DETAILS
                _fareRow(
                  "Extra you earn",
                  "+₹48",
                  isGreen: true,
                  bigFont: true,
                ),
                _fareRow("Detour added", "~3 min"),
                _fareRow("Their drop-off", "Kharadi (on route)"),
              ],
            ),
          ),

          SizedBox(height: 12),

          /// 💺 SEAT GRID
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 2.2,
            children: [
              _seatTile("You", Color(0xFF374151), Colors.white),
              _seatTile("Pax A", Color(0xFFE6F7F1), Color(0xFF0D6B4A)),
              _seatTile(
                "${name.split(' ')[0]}?",
                Color(0xFFFEF3C7),
                Color(0xFF92400E),
                isDashed: true,
              ),
              _seatTile(
                "Free",
                Color(0xFFF3F4F6),
                Color(0xFF9CA3AF),
                isDashed: true,
              ),
            ],
          ),

          SizedBox(height: 14),

          /// ⏱ TIMER
          Center(
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFFF59E0B), width: 3),
              ),
              child: Center(
                child: Text(
                  "38",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF59E0B),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 16),

          /// 🚀 BUTTONS
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text("Decline"),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PickupDetourPage(phone: phone),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1A9E6E),
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text("Accept +₹48"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _fareRow(
    String label,
    String value, {
    bool isGreen = false,
    bool bigFont = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: bigFont ? 16 : 13,
              fontWeight: FontWeight.w600,
              color: isGreen ? Color(0xFF1A9E6E) : Colors.grey.shade800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _seatTile(String label, Color bg, Color fg, {bool isDashed = false}) {
    return Container(
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDashed ? Colors.grey.shade300 : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: fg,
          ),
        ),
      ),
    );
  }
}
