import 'package:flutter/material.dart';
import 'set_destination_page.dart';
import 'pay_wallet_page.dart';
import 'profile.dart';

class DriverHomePage extends StatelessWidget {
  final String phone;

  DriverHomePage({required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 👋 GREETING + AVATAR ROW
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good morning 👋",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "Rajan Kumar",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          backgroundColor: Color(0xFFE6F7F1),
                          child: Text(
                            "RK",
                            style: TextStyle(
                              color: Color(0xFF0D6B4A),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16),

                    /// 💰 EARNINGS CARD
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xFF1A9E6E),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Today's earnings",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "₹842",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              _statBox("6", "Rides"),
                              SizedBox(width: 16),
                              _statBox("3", "Shared"),
                              SizedBox(width: 16),
                              _statBox("4.9", "Rating"),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 14),

                    /// 🚗 START A RIDE BUTTON (large tappable card)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SetDestinationPage(phone: phone),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 18),
                        decoration: BoxDecoration(
                          color: Color(0xFF1A9E6E),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Start a Ride",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Share empty seats, earn more",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 16),

                    /// 📋 TODAY'S TRIPS
                    Text(
                      "TODAY'S TRIPS",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        letterSpacing: 0.5,
                      ),
                    ),

                    SizedBox(height: 8),

                    _tripTile(
                      "AP",
                      "Station → Hadapsar",
                      "Shared · 2 passengers · 8:24 AM",
                      "₹148",
                      Color(0xFFEDE9FE),
                      Color(0xFF5B21B6),
                    ),
                    _tripTile(
                      "SM",
                      "Kothrud → Camp",
                      "Solo · 1 passenger · 7:10 AM",
                      "₹95",
                      Color(0xFFE6F7F1),
                      Color(0xFF0D6B4A),
                    ),
                  ],
                ),
              ),
            ),

            /// 🔻 BOTTOM NAV
            _bottomNav(context, 0),
          ],
        ),
      ),
    );
  }

  Widget _statBox(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.white70)),
      ],
    );
  }

  Widget _tripTile(
    String initials,
    String route,
    String sub,
    String amount,
    Color avatarBg,
    Color avatarFg,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: avatarBg,
            child: Text(
              initials,
              style: TextStyle(
                color: avatarFg,
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
                  route,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
                Text(sub, style: TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A9E6E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomNav(BuildContext context, int currentIndex) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          _navItem(Icons.home, "Home", currentIndex == 0, () {}),
          _navItem(Icons.directions_car, "Ride", currentIndex == 1, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SetDestinationPage(phone: '')),
            );
          }),
          _navItem(
            Icons.account_balance_wallet,
            "Earnings",
            currentIndex == 2,
            () {},
          ),
          _navItem(Icons.person, "Profile", currentIndex == 3, () {}),
        ],
      ),
    );
  }

  Widget _navItem(
    IconData icon,
    String label,
    bool active,
    VoidCallback onTap,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: active ? Color(0xFF1A9E6E) : Colors.grey,
                size: 22,
              ),
              SizedBox(height: 3),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: active ? Color(0xFF1A9E6E) : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
