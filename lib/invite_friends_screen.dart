import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class InviteFriendsScreen extends StatelessWidget {
  const InviteFriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Invite Friends')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.person_add_outlined,
              size: 80.0,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 24.0),
            const Text(
              'Invite your friends to join!',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Share the link below with your friends via messaging apps, email, or social media.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
            const SizedBox(height: 24.0),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'https://your_app_invite_link.com/abcdef123', // Replace with your actual invite link
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: () {
                      // Implement copy to clipboard functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invite link copied')),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton.icon(
              icon: const Icon(Icons.share),
              label: const Text('Share Invite Link'),
              onPressed: () async {
                // Use the share_plus plugin to share the link
                await Share.share(
                  'Join me on this awesome app! https://your_app_invite_link.com/abcdef123',
                ); // Replace with your actual message and link
              },
            ),
            const SizedBox(height: 24.0),
            const Text(
              'Other ways to invite:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            ListTile(
              leading: const Icon(Icons.message_outlined),
              title: const Text('Invite via SMS'),
              onTap: () {
                // Implement SMS invitation logic
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Invite via SMS tapped')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.email_outlined),
              title: const Text('Invite via Email'),
              onTap: () {
                // Implement Email invitation logic
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Invite via Email tapped')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
