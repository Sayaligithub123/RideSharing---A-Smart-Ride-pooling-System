import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'role_selection.dart';

class OtpPage extends StatefulWidget {
  final String verificationId;

  OtpPage({required this.verificationId});

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final List<TextEditingController> controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  FirebaseAuth auth = FirebaseAuth.instance;

  String getOtp() {
    return controllers.map((e) => e.text).join();
  }

  void verifyOTP() async {
    String otp = getOtp();

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: otp,
    );

    try {
      await auth.signInWithCredential(credential);

      /// ✅ NAVIGATE HERE AFTER SUCCESS
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => RoleSelectionPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Invalid OTP")));
    }
  }

  Widget otpBox(int index) {
    return SizedBox(
      width: 45,
      child: TextField(
        controller: controllers[index],
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: Color(0xFFF9FAFB),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 5) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 60),

            /// BACK BUTTON
            Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                backgroundColor: Color(0xFFF3F4F6),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),

            SizedBox(height: 30),

            /// ICON
            Text("📱", style: TextStyle(fontSize: 40)),

            SizedBox(height: 15),

            /// TITLE
            Text(
              "Verify your number",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 8),

            Text(
              "We sent a 6-digit code",
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 25),

            /// OTP BOXES
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) => otpBox(index)),
            ),

            SizedBox(height: 20),

            /// RESEND TEXT
            Text(
              "Didn't receive? Resend in 45s",
              style: TextStyle(color: Colors.grey),
            ),

            SizedBox(height: 25),

            /// BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: verifyOTP,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1A9E6E),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  "Verify & Continue →",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
