import 'package:flutter/material.dart';

class NewGroupScreen extends StatefulWidget {
  const NewGroupScreen({super.key});

  @override
  State<NewGroupScreen> createState() => _NewGroupScreenState();
}

class _NewGroupScreenState extends State<NewGroupScreen> {
  final TextEditingController _groupNameController = TextEditingController();
  final List<String> _selectedContacts = []; // To store selected contacts

  @override
  void dispose() {
    _groupNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Group'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed:
                _selectedContacts.isNotEmpty &&
                        _groupNameController.text.isNotEmpty
                    ? () {
                      // Implement logic to create the new group with _groupNameController.text and _selectedContacts
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Creating group "${_groupNameController.text}" with ${_selectedContacts.length} contacts',
                          ),
                        ),
                      );
                    }
                    : null, // Disable button if no contacts selected or group name is empty
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _groupNameController,
              decoration: const InputDecoration(
                hintText: 'Group Name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  // Trigger rebuild to enable/disable the forward button
                });
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Add Participants',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount:
                  _dummyContacts
                      .length, // Replace with your actual contact list
              itemBuilder: (context, index) {
                final contact = _dummyContacts[index];
                return CheckboxListTile(
                  title: Text(contact['name']!),
                  subtitle: Text(contact['phone']!),
                  value: _selectedContacts.contains(contact['id']),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        _selectedContacts.add(contact['id']!);
                      } else {
                        _selectedContacts.remove(contact['id']);
                      }
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Dummy contact list for demonstration
  final List<Map<String, String>> _dummyContacts = [
    {'id': '1', 'name': 'Alice', 'phone': '+1 123 456 7890'},
    {'id': '2', 'name': 'Bob', 'phone': '+1 987 654 3210'},
    {'id': '3', 'name': 'Charlie', 'phone': '+1 555 121 2323'},
    {'id': '4', 'name': 'David', 'phone': '+1 333 444 5555'},
    {'id': '5', 'name': 'Eve', 'phone': '+1 777 888 9999'},
  ];
}
