import 'package:flutter/material.dart';
import 'package:telegram_drawer_demo/calls_screen.dart';
import 'package:telegram_drawer_demo/contacts_screen.dart';
import 'package:telegram_drawer_demo/invite_friends_screen.dart';
import 'package:telegram_drawer_demo/my_profile_screen.dart';
import 'package:telegram_drawer_demo/new_group_screen.dart';
import 'package:telegram_drawer_demo/saved_messages_screen.dart';
import 'package:telegram_drawer_demo/settings_screen.dart';
import 'package:telegram_drawer_demo/telegram_features_screen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _accountsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _buildHeader(context),
          ExpansionTile(
            title: const Text('Accounts'),
            initiallyExpanded: _accountsExpanded,
            onExpansionChanged: (bool expanded) {
              setState(() {
                _accountsExpanded = expanded;
              });
            },
            children: <Widget>[
              ListTile(
                leading: const CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage("assets/loki.jpg"),
                ),
                title: const Text('Yohannes 1'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Switched to Yohannes 1')),
                  );
                },
              ),
              ListTile(
                leading: const CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage("assets/loki.jpg"),
                ),
                title: const Text('Yohannes 2'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Switched to Yohannes 2')),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: ListTile(
                  leading: const Icon(Icons.add),
                  title: const Text('Add Account'),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Add Account tapped')),
                    );
                  },
                ),
              ),
            ],
          ),
          _buildMenuItem(
            context,
            Icons.person_outline,
            'My Profile',
              onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyProfileScreen(),
                ),
              );
            },

          ),
          _buildMenuItem(
            context,
            Icons.group_outlined,
            'New Group',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NewGroupScreen()),
              );
            },
          ),
          _buildMenuItem(
            context,
            Icons.contacts_outlined,
            'Contacts',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ContactsScreen()),
              );
            },
          ),
          _buildMenuItem(
            context,
            Icons.call_outlined,
            'Calls',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CallsScreen()),
              );
            },
          ),
          _buildMenuItem(
            context,
            Icons.bookmark_border,
            'Saved Messages',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SavedMessagesScreen(),
                ),
              );
            },
          ),
          _buildMenuItem(
            context,
            Icons.settings_outlined,
            'Settings',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
          const Divider(),
          _buildMenuItem(
            context,
            Icons.person_add_outlined,
            'Invite Friends',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InviteFriendsScreen(),
                ),
              );
            },
          ),
          _buildMenuItem(
            context,
            Icons.rocket_launch_outlined,
            'Telegram Features',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TelegramFeaturesScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Header tapped (Profile/Accounts)')),
        );
      },
      child: Container(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.only(top: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/loki.jpg"),
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Yohannes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(
                      Icons.brightness_4_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Theme toggled')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String text, {
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(text, style: const TextStyle(fontWeight: FontWeight.w500)),
      onTap: onTap,
    );
  }
}
