import 'package:flutter/material.dart';
import 'package:telegram_drawer_demo/custom_drawer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Telegram'),
      ),
      drawer: CustomDrawer(),
    );
  }
}
