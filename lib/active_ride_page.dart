import 'package:flutter/material.dart';
import 'join_request_modal.dart';

class ActiveRidePage extends StatefulWidget {
  final String phone;
  ActiveRidePage({required this.phone});

  @override
  _ActiveRidePageState createState() => _ActiveRidePageState();
}

class _ActiveRidePageState extends State<ActiveRidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            /// 🗺 MAP AREA
            Container(
              height: 280,
              color: Color(0xFFE8F0E8),
              child: Stack(
                children: [
                  // Fake map roads
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 40 * 375 / 100,
                    child: Container(width: 6, color: Colors.white),
                  ),
                  Positioned(
                    top: 140,
                    left: 0,
                    right: 0,
                    child: Container(height: 6, color: Colors.white),
                  ),

                  // Car icon
                  Positioned(
                    top: 125,
                    left: 100,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Color(0xFF1A9E6E),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text("🚗", style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ),

                  // Destination pin
                  Positioned(
                    bottom: 30,
                    left: 200,
                    child: Icon(
                      Icons.location_on,
                      color: Color(0xFF1A9E6E),
                      size: 28,
                    ),
                  ),

                  // Route info badge
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFF1A9E6E).withOpacity(0.95),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Heading to",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            "Hadapsar · 6.2 km",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "~18 min",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Seats free badge
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Seats",
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                          Text(
                            "2",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A9E6E),
                            ),
                          ),
                          Text(
                            "free",
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// 🔽 BOTTOM PANEL
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    /// 👤 CURRENT PASSENGER
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xFFEDE9FE),
                          child: Text(
                            "AP",
                            style: TextStyle(
                              color: Color(0xFF5B21B6),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Arjun P. · Pax A",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Drop: Magarpatta · 5.1 km",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFE6F7F1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "In car",
                            style: TextStyle(
                              color: Color(0xFF0D6B4A),
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
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
                        _seatTile(
                          "Pax A",
                          Color(0xFFE6F7F1),
                          Color(0xFF0D6B4A),
                          isBordered: true,
                          borderColor: Color(0xFF1A9E6E),
                        ),
                        _seatTile(
                          "Free",
                          Color(0xFFF3F4F6),
                          Color(0xFF9CA3AF),
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

                    SizedBox(height: 12),

                    /// 🔔 NEW JOIN REQUEST BANNER
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (_) => JoinRequestModal(
                            name: "Priya Bhatt",
                            seats: "1 seat",
                            phone: widget.phone,
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFFEF3C7),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Color(0xFFF59E0B),
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              "New join request! Tap to review",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF92400E),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 12),

                    /// 🛑 END RIDE EARLY BUTTON
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "End Ride Early",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _seatTile(
    String label,
    Color bg,
    Color fg, {
    bool isBordered = false,
    bool isDashed = false,
    Color borderColor = Colors.transparent,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isBordered ? borderColor : Colors.grey.shade300,
          width: isBordered ? 1.5 : 1,
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
