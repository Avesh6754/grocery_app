import 'package:flutter/material.dart';



class ProfilePage extends StatelessWidget {
  final String name = "Avesh Prajapati";
  final String email = "avesh@example.com";
  final String phone = "+91 98765 43210";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.green.shade100,
              child: Text(
                name[0],
                style: TextStyle(fontSize: 40, color: Colors.green.shade800),
              ),
            ),
            SizedBox(height: 16),
            Text(name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(email, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
            SizedBox(height: 2),
            Text(phone, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
            SizedBox(height: 30),
            Divider(thickness: 1),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.green),
              title: Text('Settings'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text('Logout'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
