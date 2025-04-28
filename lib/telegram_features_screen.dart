import 'package:flutter/material.dart';

class TelegramFeaturesScreen extends StatelessWidget {
  const TelegramFeaturesScreen({super.key});

  final List<Map<String, String>> _features = const [
    {
      'title': 'Cloud-based',
      'description': 'Access your messages from any device.',
    },
    {
      'title': 'End-to-end Encryption',
      'description': 'Secure your private chats with encryption.',
    },
    {
      'title': 'Groups & Channels',
      'description': 'Create large group chats and broadcast channels.',
    },
    {
      'title': 'Stickers, GIFs & Emojis',
      'description': 'Express yourself with fun and engaging media.',
    },
    {
      'title': 'File Sharing',
      'description': 'Send and receive large files of any type.',
    },
    {
      'title': 'Bots',
      'description': 'Automate tasks and enhance your experience with bots.',
    },
    {
      'title': 'Voice & Video Calls',
      'description': 'Make clear and reliable calls to your contacts.',
    },
    {
      'title': 'No Storage Limits',
      'description': 'Store your media and files in the cloud for free.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Telegram Features')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: _features.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (context, index) {
          final feature = _features[index];
          return ListTile(
            title: Text(
              feature['title']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(feature['description']!),
            ),
          );
        },
      ),
    );
  }
}
