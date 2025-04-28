import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _contacts =
      _dummyContacts; // Start with all contacts
  List<Map<String, String>> _filteredContacts =
      _dummyContacts; // For search results

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterContacts);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterContacts() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredContacts =
          _contacts.where((contact) {
            return contact['name']!.toLowerCase().contains(query) ||
                contact['phone']!.toLowerCase().contains(query);
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search Contacts',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Implement logic to add a new contact
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Add Contact tapped')),
              );
            },
          ),
        ],
      ),
      body:
          _filteredContacts.isEmpty
              ? const Center(child: Text('No contacts found.'))
              : ListView.builder(
                itemCount: _filteredContacts.length,
                itemBuilder: (context, index) {
                  final contact = _filteredContacts[index];
                  return ListTile(
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(
                        'assets/user_placeholder.png',
                      ), // Replace with contact's image
                    ),
                    title: Text(contact['name']!),
                    subtitle: Text(contact['phone']!),
                    onTap: () {
                      // Implement logic to open the contact's details
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Tapped on ${contact['name']}')),
                      );
                    },
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement logic to start a new chat
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Start New Chat tapped')),
          );
        },
        child: const Icon(Icons.chat),
      ),
    );
  }

  // Dummy contact list for demonstration
  static final List<Map<String, String>> _dummyContacts = [
    {'id': '1', 'name': 'Alice', 'phone': '+1 123 456 7890'},
    {'id': '2', 'name': 'Bob', 'phone': '+1 987 654 3210'},
    {'id': '3', 'name': 'Charlie', 'phone': '+1 555 121 2323'},
    {'id': '4', 'name': 'David', 'phone': '+1 333 444 5555'},
    {'id': '5', 'name': 'Eve', 'phone': '+1 777 888 9999'},
    {'id': '6', 'name': 'Fiona', 'phone': '+1 111 222 3333'},
    {'id': '7', 'name': 'George', 'phone': '+1 444 555 6666'},
    {'id': '8', 'name': 'Hannah', 'phone': '+1 777 999 1111'},
    {'id': '9', 'name': 'Ivy', 'phone': '+1 222 333 4444'},
    {'id': '10', 'name': 'Jack', 'phone': '+1 555 777 9999'},
  ];
}
