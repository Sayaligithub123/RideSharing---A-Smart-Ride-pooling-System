import 'package:flutter/material.dart';

class RideSummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ride Summary"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Text(
              "Ride Completed 🎉",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            ListTile(
              title: Text("Driver"),
              subtitle: Text("Rahul"),
            ),

            ListTile(
              title: Text("Fare"),
              subtitle: Text("₹120"),
            ),

            Spacer(),

            /// 🔥 SUBMIT BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/home',
                    (route) => false,
                  );
                },
                child: Text("Submit & Go Home"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}