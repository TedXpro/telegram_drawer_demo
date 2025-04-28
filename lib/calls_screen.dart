import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  final List<Map<String, dynamic>> _callHistory = const [
    {
      'name': 'Alice',
      'phone': '+1 123 456 7890',
      'time': 'Yesterday, 8:30 PM',
      'type': 'outgoing',
      'duration': '2:15',
    },
    {
      'name': 'Bob',
      'phone': '+1 987 654 3210',
      'time': 'Today, 10:00 AM',
      'type': 'incoming',
      'duration': '1:48',
    },
    {
      'name': 'Charlie',
      'phone': '+1 555 121 2323',
      'time': 'Today, 2:00 PM',
      'type': 'missed',
    },
    {
      'name': 'David',
      'phone': '+1 333 444 5555',
      'time': 'April 25, 6:00 PM',
      'type': 'outgoing',
      'duration': '0:59',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calls'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement call log search functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Search Calls tapped')),
              );
            },
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text(
                'Recent Calls',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
          ),
        ),
      ),
      body:
          _callHistory.isEmpty
              ? const Center(child: Text('No call history yet.'))
              : ListView.builder(
                itemCount: _callHistory.length,
                itemBuilder: (context, index) {
                  final call = _callHistory[index];
                  IconData icon;
                  Color iconColor = Colors.green;
                  if (call['type'] == 'incoming') {
                    icon = Icons.call_received;
                  } else if (call['type'] == 'outgoing') {
                    icon = Icons.call_made;
                  } else {
                    icon = Icons.call_missed;
                    iconColor = Colors.red;
                  }

                  return ListTile(
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(
                        'assets/user_placeholder.png',
                      ), // Replace with contact's image
                    ),
                    title: Text(call['name']!),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(icon, color: iconColor, size: 16.0),
                        const SizedBox(width: 8.0),
                        Text(call['time']!),
                        if (call['duration'] != null) ...[
                          const SizedBox(width: 8.0),
                          Text('(${call['duration']})'),
                        ],
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.call),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        // Implement making a call to this number
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Calling ${call['name']}')),
                        );
                      },
                    ),
                    onTap: () {
                      // Implement viewing call details
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'View call details for ${call['name']}',
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement starting a new call
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Start New Call tapped')),
          );
        },
        child: const Icon(Icons.add_call),
      ),
    );
  }
}
