import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      'assets/icons/me.png'), // Ganti dengan gambar profil
                ),
                SizedBox(height: 16),
                Text(
                  'Aletta Olivia',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit Profile'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Handle edit profile tap
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Change Password'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Handle change password tap
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('My Bookings'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Handle my bookings tap
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('My Addresses'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Handle my addresses tap
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Privacy Policy'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Handle privacy policy tap
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.article),
            title: Text('Terms & Conditions'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Handle terms & conditions tap
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text('Logout'),
            onTap: () {
              // Handle logout tap
            },
          ),
        ],
      ),
    );
  }
}
