import 'package:flutter/material.dart';
import 'package:telegram_drawer_demo/home.dart';

void main() {
  runApp(TelegramDrawerDemoApp());
}

class TelegramDrawerDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telegram Drawer Demo',
      home: Home(),
    );
  }
}
