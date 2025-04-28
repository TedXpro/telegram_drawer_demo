import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                  'assets/loki.jpg',
                ), // Replace with user's profile image
              ),
            ),
            const SizedBox(height: 24.0),
            const Text(
              'Personal Information',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            _buildProfileInfo(
              title: 'Name',
              value: 'Yohannes',
            ), // Replace with actual name
            _buildProfileInfo(
              title: 'Phone',
              value: '+251 9XXXXXXXXX',
            ), // Replace with actual phone
            _buildProfileInfo(
              title: 'Username',
              value: '@yohannes_dev',
            ), // Replace with actual username
            _buildProfileInfo(
              title: 'Bio',
              value: 'Flutter enthusiast and aspiring developer.',
            ), // Replace with actual bio
            const SizedBox(height: 24.0),
            const Text(
              'Settings',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            _buildSettingsItem(
              icon: Icons.notifications_outlined,
              title: 'Notifications & Sounds',
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.privacy_tip_outlined,
              title: 'Privacy & Security',
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.chat_bubble_outline,
              title: 'Chat Settings',
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.folder_outlined,
              title: 'Folders',
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.language_outlined,
              title: 'Language',
              onTap: () {},
            ),
            const SizedBox(height: 24.0),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  // Implement logout functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logout Tapped')),
                  );
                },
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(value, style: const TextStyle(fontSize: 16.0)),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: <Widget>[
            Icon(icon, color: Colors.black87),
            const SizedBox(width: 16.0),
            Text(title, style: const TextStyle(fontSize: 16.0)),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16.0, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
