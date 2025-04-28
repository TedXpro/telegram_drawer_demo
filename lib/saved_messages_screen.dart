import 'package:flutter/material.dart';

class SavedMessagesScreen extends StatelessWidget {
  const SavedMessagesScreen({super.key});

  final List<Map<String, String>> _savedMessages = const [
    {
      'text': 'Remember to buy groceries tomorrow: milk, eggs, bread.',
      'time': 'Today, 10:15 AM',
    },
    {
      'text': 'Meeting notes from yesterday\'s session are attached.',
      'time': 'Yesterday, 3:00 PM',
    },
    {
      'text': 'Link to the important document: [https://example.com/document]',
      'time': 'April 24, 11:45 AM',
    },
    {
      'text': 'Just a reminder about the upcoming deadline on Friday.',
      'time': 'April 23, 5:30 PM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saved Messages')),
      body:
          _savedMessages.isEmpty
              ? const Center(child: Text('No saved messages yet.'))
              : ListView.builder(
                itemCount: _savedMessages.length,
                itemBuilder: (context, index) {
                  final message = _savedMessages[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          message['text']!,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          message['time']!,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  );
                },
              ),
    );
  }
}