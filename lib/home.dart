import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: Column(
          children: [

            // 🔶 Top Location Banner
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              color: Colors.orange[800],
              child: Row(
                children: [
                  Icon(Icons.location_off, color: Colors.white),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Location sharing disabled. Tap to enable",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16)
                ],
              ),
            ),

            // 🔍 Search Bar
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.white),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Enter pickup location",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Later",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),

            // 🧾 Services Section
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("For you",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Icon(Icons.arrow_forward, color: Colors.white)
                        ],
                      ),
                    ),

                    SizedBox(height: 10),

                    // Grid Items
                    GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(15),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: [

                        buildItem(Icons.directions_car, "Ride"),
                        buildItem(Icons.car_rental, "Intercity"),
                        buildItem(Icons.local_taxi, "Auto"),
                        buildItem(Icons.calendar_today, "Reserve"),
                        buildItem(Icons.directions_bus, "Bus"),
                        buildItem(Icons.person, "Seniors"),

                      ],
                    ),

                    // 📦 Card Section
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.person_add, color: Colors.white),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Book for someone else",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  Text("Add a rider to get started",
                                      style: TextStyle(
                                          color: Colors.white70)),
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_forward, color: Colors.white)
                          ],
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

      // 🔻 Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: "Services"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Activity"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }

  // 🔹 Grid Item Widget
  Widget buildItem(IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 30),
          SizedBox(height: 8),
          Text(title, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}