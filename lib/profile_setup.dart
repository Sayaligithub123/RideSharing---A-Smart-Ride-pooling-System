import 'package:flutter/material.dart';
import 'passenger_homepage.dart';
import 'driver_homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileSetupPage extends StatefulWidget {
  final String role;
  final String phone;

  const ProfileSetupPage({
    super.key,
    required this.role,
    required this.phone,
  });

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final emergencyController = TextEditingController();

<<<<<<< HEAD
  bool isLoading = false;

  /// ✅ SAVE PROFILE FUNCTION
  void saveProfile() async {
    if (nameController.text.isEmpty ||
        emergencyController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill required fields")),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final response = await http.post(
        Uri.parse("http://192.168.31.52:5000/api/users/save-profile"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "phone": widget.phone,
          "name": nameController.text,
          "email": emailController.text,
          "emergency": emergencyController.text,
          "role": widget.role,
        }),
      );

      setState(() => isLoading = false);

      if (response.statusCode == 200) {
        print("✅ Profile saved");

        /// ✅ NAVIGATION FIXED
        if (widget.role.toLowerCase() == "driver") {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => DriverHomePage(), // ✅ no const
    ),
  );
} else {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => PassengerHomePage(
        phone: widget.phone,
      ),
    ),
  );
}
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Server error! Try again")),
        );
      }
    } catch (e) {
      setState(() => isLoading = false);

      print("❌ Exception: $e");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Connection failed")),
      );
=======
  bool _isLoading = false;

  void saveProfile() async {
    if (nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please enter your name")));
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await http
          .post(
            Uri.parse("http://10.47.117.100:5000/api/users/save-profile"),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              "phone": widget.phone,
              "name": nameController.text,
              "email": emailController.text,
              "emergency": emergencyController.text,
              "role": widget.role,
            }),
          )
          .timeout(
            Duration(seconds: 10),
            onTimeout: () {
              throw Exception("Connection timed out. Check your server.");
            },
          );

      if (response.statusCode == 200) {
        if (widget.role == "driver") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => DriverHomePage(phone: widget.phone), // ✅ FIXED
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => PassengerHomePage(phone: widget.phone),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Server error: ${response.statusCode}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
    } finally {
      setState(() => _isLoading = false);
>>>>>>> 8cd0ed2 (updated driver module)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView( // ✅ FIX overflow issue
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                /// 🔙 HEADER
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Your Profile",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

<<<<<<< HEAD
                /// 👤 PROFILE IMAGE
                Column(
                  children: const [
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Color(0xFFE6F7F1),
                      child: Icon(Icons.add,
                          size: 35, color: Color(0xFF1A9E6E)),
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

                const SizedBox(height: 30),

                /// 🧾 INPUT FIELDS
                inputField("Full name", nameController),
                const SizedBox(height: 15),

                inputField("Email (optional)", emailController),
                const SizedBox(height: 15),

                inputField("Emergency contact", emergencyController),

                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 10),

                /// 🔒 PRIVACY TEXT
                Row(
                  children: const [
                    Icon(Icons.lock, size: 16, color: Colors.grey),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        "Your data is encrypted and never shared without consent",
                        style:
                            TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                /// 🚀 BUTTON
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : saveProfile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1A9E6E),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white)
                        : const Text(
                            "Complete Setup →",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
=======
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

              /// 🚀 BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1A9E6E),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: _isLoading
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          "Complete Setup →",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
>>>>>>> 8cd0ed2 (updated driver module)
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget inputField(String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hint,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF9FAFB),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
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