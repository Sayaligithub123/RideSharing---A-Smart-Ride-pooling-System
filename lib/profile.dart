import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfilePage extends StatefulWidget {
  final String phone;

  ProfilePage({required this.phone});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  /// 🔥 FETCH USER DATA
  void fetchUser() async {
    final response = await http.get(
      Uri.parse("http://10.47.117.100:5000/api/users/get-user/${widget.phone}"),
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
      appBar: AppBar(title: Text("My Profile")),

      body: userData == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  /// 👤 PROFILE AVATAR
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(0xFFE6F7F1),
                    child: Text(
                      userData!['name'][0],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  /// NAME
                  Text(
                    userData!['name'],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 5),

                  Text(userData!['email'] ?? ""),

                  SizedBox(height: 20),

                  /// DETAILS CARD
                  Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.phone),
                          title: Text("Phone"),
                          subtitle: Text(userData!['phone']),
                        ),
                        ListTile(
                          leading: Icon(Icons.warning),
                          title: Text("Emergency Contact"),
                          subtitle: Text(userData!['emergency']),
                        ),
                        ListTile(
                          leading: Icon(Icons.person),
                          title: Text("Role"),
                          subtitle: Text(userData!['role']),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
