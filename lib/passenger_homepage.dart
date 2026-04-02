import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'profile.dart';

class PassengerHomePage extends StatefulWidget {
  final String phone;

  PassengerHomePage({required this.phone});

  @override
  _PassengerHomePageState createState() => _PassengerHomePageState();
}

class _PassengerHomePageState extends State<PassengerHomePage> {
  Map<String, dynamic>? userData;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ProfilePage(phone: widget.phone)),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  /// 🔥 FETCH USER DATA FROM BACKEND
  void fetchUser() async {
    final response = await http.get(
      Uri.parse("http://127.0.0.1:5000/api/users/get-user/${widget.phone}"),
    );

    if (response.statusCode == 200) {
      setState(() {
        userData = jsonDecode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          /// 🔥 TOP MAP SECTION (DESIGN FROM PROTOTYPE)
          Container(
            height: 300,
            decoration: BoxDecoration(color: Color(0xFFE6F7F1)),
            child: Stack(
              children: [
                /// FAKE MAP UI
                Center(child: Text("🗺 Map View")),

                /// SEARCH BAR
                Positioned(
                  top: 40,
                  left: 16,
                  right: 16,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 6),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 10),
                        Text(
                          "Where are you going?",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),

                /// RIDES NEARBY BADGE
                Positioned(
                  bottom: 20,
                  right: 16,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "2 rides nearby",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// 🔥 USER NAME (PROFILE DATA)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFFE6F7F1),
                  child: Text(
                    userData == null ? "?" : userData!['name'][0],
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  userData == null
                      ? "Loading..."
                      : "Hello, ${userData!['name']}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          /// 🔥 RECENT DESTINATIONS
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recent destinations",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 10),

                  ListTile(
                    leading: Icon(Icons.location_city),
                    title: Text("Hadapsar, Pune"),
                    subtitle: Text("Used yesterday"),
                  ),

                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Kothrud, Pune"),
                    subtitle: Text("Home · 3.2 km"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      /// 🔥 BOTTOM NAVIGATION (LIKE PROTOTYPE)
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: "Wallet",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
