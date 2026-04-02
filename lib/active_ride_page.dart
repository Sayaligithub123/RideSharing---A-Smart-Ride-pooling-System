import 'package:flutter/material.dart';

class ActiveRidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Active Ride"),
        backgroundColor: Color(0xFF1A9E6E),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// 🟢 LIVE STATUS
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFE6F7F1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Icon(Icons.radio_button_checked, color: Colors.green),
                  SizedBox(width: 10),
                  Text(
                    "You are LIVE",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            /// 🔔 NEW JOIN REQUEST BANNER
            GestureDetector(
              onTap: () {
                openJoinRequestModal(context);
              },
              child: Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.notifications, color: Colors.orange),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "New join request! Tap to review",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            /// 👥 PASSENGER REQUESTS TITLE
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Passenger Requests",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 10),

            /// 📋 LIST OF REQUESTS
            Expanded(
              child: ListView(
                children: [
                  requestCard("Rahul", "2 seats"),
                  requestCard("Priya", "1 seat"),
                ],
              ),
            ),

            /// 🛑 END RIDE BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text("End Ride"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 📦 REQUEST CARD
  Widget requestCard(String name, String seats) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text(name[0])),
        title: Text(name),
        subtitle: Text(seats),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check, color: Colors.green),
            SizedBox(width: 10),
            Icon(Icons.close, color: Colors.red),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////
// 🔥 NEW MODAL (UPDATED PROFESSIONAL UI)
//////////////////////////////////////////////////////////////////

void openJoinRequestModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => JoinRequestModal(),
  );
}

//////////////////////////////////////////////////////////////////
// 📱 JOIN REQUEST MODAL UI
//////////////////////////////////////////////////////////////////

class JoinRequestModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
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

          SizedBox(height: 15),

          /// TITLE
          Text(
            "New Join Request",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 20),

          /// PASSENGER CARD
          Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Color(0xFF1A9E6E),
                  child: Text(
                    "R",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                SizedBox(width: 15),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rahul Sharma",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text("2 seats requested"),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          /// EXTRA DETAILS (like prototype)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              infoBox("Rating", "4.8 ⭐"),
              infoBox("Trips", "12"),
              infoBox("Payment", "Online"),
            ],
          ),

          SizedBox(height: 25),

          /// BUTTONS
          Row(
            children: [

              /// REJECT
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Reject"),
                ),
              ),

              SizedBox(width: 10),

              /// ACCEPT
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Request Accepted")),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1A9E6E),
                  ),
                  child: Text("Accept"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// SMALL INFO BOX
  Widget infoBox(String title, String value) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(title, style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}