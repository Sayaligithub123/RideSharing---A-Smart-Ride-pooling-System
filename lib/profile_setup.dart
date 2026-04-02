import 'package:flutter/material.dart';
import 'passenger_homepage.dart';
import 'driver_homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileSetupPage extends StatefulWidget {
  final String role;
  final String phone; // ✅ ADD PHONE

  ProfileSetupPage({required this.role, required this.phone});

  @override
  _ProfileSetupPageState createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final emergencyController = TextEditingController();

  /// ✅ SAVE PROFILE FUNCTION
  void saveProfile() async {
    try {
      final response = await http.post(
        Uri.parse("http://127.0.0.1:5000/api/users/save-profile"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "phone": widget.phone,
          "name": nameController.text,
          "email": emailController.text,
          "emergency": emergencyController.text,
          "role": widget.role,
        }),
      );

      if (response.statusCode == 200) {
        print("Profile saved successfully");

        /// ✅ NAVIGATION AFTER SAVE
        if (widget.role == "driver") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => DriverHomePage()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => PassengerHomePage()),
          );
        }
      } else {
        print("Error: ${response.body}");
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Failed to save profile")));
      }
    } catch (e) {
      print("Exception: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Server error")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              /// 🔙 BACK BUTTON + TITLE
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Your Profile",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              SizedBox(height: 20),

              /// 👤 PROFILE IMAGE
              Column(
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Color(0xFFE6F7F1),
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFF1A9E6E), width: 2),
                    ),
                    child: Icon(Icons.add, size: 35, color: Color(0xFF1A9E6E)),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Upload photo",
                    style: TextStyle(
                      color: Color(0xFF1A9E6E),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),

              /// 🧾 INPUT FIELDS
              inputField("Full name", nameController),
              SizedBox(height: 15),

              inputField("Email (optional)", emailController),
              SizedBox(height: 15),

              inputField("Emergency contact", emergencyController),

              SizedBox(height: 20),

              Divider(),
              SizedBox(height: 10),

              /// 🔒 PRIVACY TEXT
              Row(
                children: [
                  Icon(Icons.lock, size: 16, color: Colors.grey),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      "Your data is encrypted and never shared without consent",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ],
              ),

              Spacer(),

              /// 🚀 BUTTON (UPDATED)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: saveProfile, // ✅ IMPORTANT CHANGE
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1A9E6E),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    "Complete Setup →",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 INPUT FIELD WIDGET
  Widget inputField(String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hint,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 6),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFF9FAFB),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
